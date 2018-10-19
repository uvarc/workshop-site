---
title: "Microbiome: Process 16S rRNA Amplicons"
author: "Hardik I Parikh"
categories: ["Bioinformatics"]
---

This tutorial outlines a *traditional* de-novo OTU clustering (@ 97% seq identity) for analyzing 16S rRNA sequencing data. We will cover the following:

- Pre-processing raw sequence data 
  - merge overlapping paired-end reads (vsearch)
  - quality filter amplicons (vsearch)
  - remove chimeric amplicons (vsearch)
- Sequence clustering and identification
  - de-novo OTU clustering (vsearch) 
- Taxonomic Assignment (RDP)

**Note:** This is a walk through of one (of the many) way(s) to analyze 16S rRNA data. As the microbiome field continues to grow, the *best-practice* workflow is constantly changing. The approach we take today, the tools we use, may not be applicable to your dataset. Also, we will skip some **extremely** important considerations for sound statistical analysis, which is beyond the scope of this workshop.


*** 

### Prerequisites
- Active account on Rivanna (UVA's high-performance compute cluster)
- Basic Unix skills 
- Familiarity with 16S rRNA amplicon sequencing

***

### Our Dataset
For today's workshop, we will work with a random subset of 100 vaginal samples, part of a larger study - *Replication and refinement of a vaginal microbial signature of preterm birth in two racially distinct cohorts of US women* [(Callahan BJ, et. al 2017)](http://www.pnas.org/content/114/37/9966). In this study, the authors investigate the vaginal microbiota's role in pre-term birth, performing taxonomic surveys using 16S rRNA amplicons. The samples were sequenced on the Illumina HiSeq platform (2 X 250), amplifying the hypervariable region 4 (V4). 

Full dataset is available at SRA under accession no. SRP115697.

***

### Tools
We will be using the following tools (and some utility scripts) for our analysis on Rivanna -

- **VSEARCH**\
VSEARCH (stands for Vectorized Search) is a toolkit for nucleotide sequence analyses, including database search and clustering algorithms. It supports clustering, chimera detection, database searching, merging of paired-end reads, and other sequence manipulation tools.  
Homepage: [https://github.com/torognes/vsearch](https://github.com/torognes/vsearch)

- **RDP Classifier**\
RDP classifier is a naive Bayesian classifier that provides taxonomic placements based on rRNA sequences.\
Homepage: [https://github.com/rdpstaff/classifier](https://github.com/rdpstaff/classifier)\
WebPortal: [https://rdp.cme.msu.edu/classifier/classifier.jsp](https://rdp.cme.msu.edu/classifier/classifier.jsp)

***

### Rivanna Working Environment
<br>

#### SSH onto Rivanna
- Open a Terminal
- Login using ESERVICES credentials

<br>

#### Allocations
For today's workshop, we will use the `somrc-hpc-workshop` allocation to run our jobs on Rivanna.  
**Note:** You will be removed from this _MyGroup_ at the end of today's session.

<br>

#### Download data


Download the workshop material to your scratch directory (replace `<mst3k>` with your username) -  
```
cd /scratch/<mst3k>

wget https://s3.amazonaws.com/somrc-workshop-data/16S-workshop.tar.gz .
```
Decompress the data
```
tar -zxvf 16S-workshop.tar.gz
```
Examine its contents
```
ls 16S-workshop
```
For your convenience, create a work-dir variable
```
export WORKDIR="/scratch/<mst3k>/16S-workshop/"
```
	
<br>
#### Start an interactive session 

You should **NOT** do your computational processing on the head node.  

In many cases, especially when you are testing/developing your analysis pipelines, you may want to perfrom the task interactively on a compute node. This can be achieved by using the `ijob` command and requesting appropriate resources. 

```
ijob -A somrc-hpc-workshop -p standard -c 10 --mem=20gb
```
<br>
#### Load modules
```
module purge
module load anaconda2
module load biopython
module load gcc/7.1.0
module load vsearch
module load rdp-classifier
```

***

### 1. Pre-processing
<br>
#### a. Merge paired-end reads
Analysis begins with merging the paired-end raw reads into longer amplicons.\
Illumina's paired-end sequencing strategy allows users to sequence both ends of the target DNA fragment. When the target DNA segment is shorter than the sum of the forward and reverse reads, merging the overlapping tails ideally give the effect of elongated reads.\
In our dataset, the V4 region (which is ~254bp) is amplified and sequenced from both ends, resulting in complete overlap.    
<br>
```
cd ${WORKDIR}/mergepairs/
```

Let's examine quality of raw files -
```
zcat ${WORKDIR}/raw_data/SRR5972053_1.fastq.gz | ${WORKDIR}/scripts/fastqstats 	
zcat ${WORKDIR}/raw_data/SRR5972053_2.fastq.gz | ${WORKDIR}/scripts/fastqstats 	
```
Notice the quality of tails for each read (positions 225-250).

Next, merge the pairs - 
```
vsearch --fastq_mergepairs ${WORKDIR}/raw_data/SRR5972053_1.fastq.gz --reverse ${WORKDIR}/raw_data/SRR5972053_2.fastq.gz --fastqout SRR5972053_merged.fastq --threads 20
```

Examine the quality of merged reads - 
```
${WORKDIR}/scripts/fastqstats SRR5972053_merged.fastq 
```

Notice the improvement in quality at postions 225-250.\

There are some false positives from the merging step, some reads after merging are longer than ~254bp. We shall remove them in the next step.  

<br>
#### b. Quality Filtering
In this step, we shall remove low quality amplicons. We will filter reads based on expected error rates, filter longer than expected amplicons, and convert the reads to fasta format.   
```
cd ${WORKDIR}/qc/
vsearch --fastq_filter ${WORKDIR}/mergepairs/SRR5972053_merged.fastq --fastq_maxee 1 --fastq_maxlen 255 --fastaout SRR5972053_merged_qc.fasta
```

<br>
#### c. Chimera Filtering
To reduce computation, this step will be performed on pooled, dereplicated sequences.

<br>
#### d. Relabel
Next, we need to relabel the sequence descriptions to match: ">SampleName_SequenceNum".\
This is REQUIRED for the downstream clustering steps! 
```
cd ${WORKDIR}/relabel/
python ${WORKDIR}/scripts/relabelFasta_file.py -in ${WORKDIR}/qc/SRR5972053_merged_qc.fasta -out SRR5972053_merged_qc_relabel.fasta
```

<br>
#### All of the above steps need to be performed on every sample in your dataset.

***
### 2. Clustering 
In the next series of steps, we will perform a *de-novo* OTU clustering using VSEARCH. We will cluster all the sequences into Operational Taxonomic Units (OTUs) at 97% identity, map the sequences back to cluster consensus sequence and generate the OTU table / Abundance matrix.

In recent times, multiple alternative approaches have been developed that look at actual sequence variants (ASVs), as opposed to 97% OTUs - [DADA2](https://www.nature.com/articles/nmeth.3869), [Unoise3](https://www.drive5.com/usearch/manual/cmd_unoise3.html), [Deblur](https://github.com/biocore/deblur). These tools attempt to correct sequencing errors ("denoise" the data) and identify real biological sequences at single nucleotide resolution. Like any other step in your analysis, the choice of clustering tool / approach depends on multiple considerations - question of interest, accuracy of identifying actual biological signal, computational requirements, easy of integration into workflow, etc. Please chose wisely!

```
cd ${WORKDIR}/clustering/
```

<br>
#### a. Pool sequences
We need to pool *merged_qc_relabel* sequences of all samples in our dataset into one FASTA file. The preprocessing steps have been performed for random 100 samples from the larger cohort and sequenes pooled into one file.\
Unzip the fasta file -  
```
gunzip relman2017_samples.fasta.gz
```

<br>
#### b. Dereplicate sequences
Next, de-replicate the sequences to reduce subsequent computation
```
vsearch --derep_fulllength relman2017_samples.fasta --output relman2017_samples.unique.fasta --sizeout
```

<br>
#### c. Remove chimeras
This is a pre-processing step, that will be performed here to reduce computation.\
We will detect chimeras using the [SILVA LTP v123](https://www.arb-silva.de/projects/living-tree/) reference database. One could also use a *de-novo* chimera detection, but that is computationally expensive.
```
vsearch --uchime_ref relman2017_samples.unique.fasta --db ${WORKDIR}/refdb/LTPs123_SSU.qiime.seq.fasta --nonchimeras relman2017_samples.unique.nonchimeras.fasta --threads 10
```

<br>
#### d. Sort sequences
Sort the sequences by their size, and remove singletons 
```
vsearch --sortbysize relman2017_samples.unique.nonchimeras.fasta --minsize 2 --output relman2017_samples.unique.nonchimeras.sorted.fasta
```

<br>
#### e. Cluster
Cluster sequences into OTUs at 97% identity threshold
```
vsearch --cluster_smallmem relman2017_samples.unique.nonchimeras.sorted.fasta --usersort --id 0.97 --consout relman2017_samples.unique.nonchimeras.sorted.rep_set.fasta --threads 10
```

<br>
#### f. Re-label OTUs
Lets re-label the cluster consensus sequences 
```
awk '/^>/{print ">OTU_" ++i; next}{print}' < relman2017_samples.unique.nonchimeras.sorted.rep_set.fasta > relman2017_samples.unique.nonchimeras.sorted.rep_set_relabel.fasta
```

<br>
#### g. Map reads back to OTUs
In this step, we will map the sequences (including the singletons) back to the cluster consensus sequences
```
vsearch --usearch_global relman2017_samples.fasta --db relman2017_samples.unique.nonchimeras.sorted.rep_set_relabel.fasta --strand both --id 0.97 --uc relman2017_samples.map.uc --threads 10
```

<br>
#### h. Create OTU Table
Finally, lets create OTU table
```
python ${WORKDIR}/scripts/usearch_pythonscripts/uc2otutab.v2.py relman2017_samples.map.uc > relman2017_samples.otu_table.txt
```

<br>
Output 
```
less -S relman2017_samples.otu_table.txt
```

***


### 3. Taxonomic Assignment
In this section, we will assign taxonomy to the OTU sequences, using the Bayesian RDP classifier.

```
cd ${WORKDIR}/rdp/
```
<br>
Load module
```
module load rdp-classifier
```
This will create the `$RDP_JAR_PATH` global variable in your environment, which defines the PATH of the classifier JAR file.\

<br>
Classify
```
java -Xmx8g -jar $RDP_JAR_PATH classify -c 0.80 -f filterbyconf -o relman2017_samples.tax_table.txt ${WORKDIR}/clustering/relman2017_samples.unique.nonchimeras.sorted.rep_set_relabel.fasta
```

`-c 0.8` is the assignment confidence cutoff.\
`-f filterbyconf` outputs the results for major ranks; results below the confidence cutoff are binned to higher ranked node  

<br>
Output 
```
less -S relman2017_samples.tax_table.txt
```

***

#### Relinquish allocations  

```
exit
```

***

### 4. Phylogenetic Tree

Reconstructing the phylogeny of the OTUs will be helpful in investigating the evolutionary relationship among them. This has already been done! 
```
cd ${WORKDIR}/phylotree/
```

Tools used: [PyNAST](http://biocore.github.io/pynast/), [FastTree](http://www.microbesonline.org/fasttree/)

***

### 5. Data Vizualization / Analysis
Downstream visualization of community composition and diversity analysis will be covered in the next workshop - 

[Microbiome: 16S Data Visualization/Analysis](../microbiome-dataviz/)
 

