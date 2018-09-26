---
title: "Next-Gen Sequence Alignment"
author: "Hardik I Parikh"
categories: ["Bioinformatics"]
---

The goal of this hands-on workshop is to perform a simple NGS data alignment against a long reference genome, using the computational resources of [Rivanna](https://arcs.virginia.edu/rivanna), UVA's high-performance computing system. We will use popular short-read aligner Bowtie2, followed by further manipulation of SAM/BAM file formats using SAMTools.  
 
**Note:** Do not use the same command options for you project data. The parameters used in the workshop are only for demonstration purposes, to familiarize yourself with different tools, its syntax and to understand the outputs. 

***

### Pre-requisites
- Familiarity with Unix command line
- Familiarity with terminal-based text editor
- Familiarity with Rivanna
- Basic understanding of NGS sequencing data 

### Tools
- [Bowtie2](http://bowtie-bio.sourceforge.net/bowtie2/index.shtml)
- [SAMtools](http://samtools.sourceforge.net/)
- [picard](https://broadinstitute.github.io/picard/)
- [BEDTools](https://bedtools.readthedocs.io/en/latest/)
- [bcftools](https://samtools.github.io/bcftools/bcftools.html)
- [IGV](http://software.broadinstitute.org/software/igv/)

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

#### Dataset
We will work with whole genome sequencing data of _NA12878_, a participant of the [1000 Genomes Project](http://www.internationalgenome.org/home), and align to _hg38_ build of human genome. 

<br>

Download the sequence data to your scratch directory (replace `<mst3k>` with your username) -  

```
cd /scratch/<mst3k>
```
```
wget https://s3.amazonaws.com/somrc-workshop-data/ngs-aln-workshop.tar.gz .
```
```
tar -zxvf ngs-aln-workshop.tar.gz
```
```
ls ngs-aln-workshop
```
```
gunzip ngs-aln-workshop/ref/hg38.subset.fa.gz
```
<br>

***

### Alignment

Bowtie2 uses the Burrows-Wheeler Transform algorithm to index the reference genome. This allows for rapid identification of potential origin of your query sequence within the large genome, with a relatively small memory footprint. I strongly encourage you to read the publication/manual pages for algorithm details.  

- [Bowtie2 Publication](https://www.nature.com/articles/nmeth.1923)
- [Bowtie2 Manual](http://bowtie-bio.sourceforge.net/bowtie2/manual.shtml)

<br>

Alignemnt is a two-step process

1. indexing the genome (only perform once)
2. aligning sample reads

<br>

#### Start an interactive session  
You should **NOT** do your computational processing on the head node.  

In many cases, especially when you are testing/developing your analysis pipelines, you may want to perfrom the task interactively on a compute node. This can be achieved by using the `ijob` command and requesting appropriate resources. 
```
ijob -A somrc-hpc-workshop -p standard -c 10 --mem=20gb
```
<br>

#### Load `bowtie2` module
```
module purge
module load bowtie2
```
<br>

#### 1. Create the index

Indexing needs to be done only once for a particular _version_ of a genome. <br>

`bowtie2-build` builds a Bowtie index from a set of DNA sequences. `bowtie2-build` outputs a set of 6 files with suffixes `.1.bt2`, `.2.bt2`, `.3.bt2`, `.4.bt2`, `.rev.1.bt2`, and `.rev.2.bt2`. These files together constitute the index: they are all that is needed to align reads to that reference. The original sequence FASTA files are no longer used by Bowtie2 once the index is built.

```
cd /scratch/<mst3k>/ngs-aln-workshop/ref/

# USAGE: 
# bowtie2-build --threads <int> <ref_in> <bt2_index_basename>
#
# For more help:
# bowtie2-build [ENTER]

bowtie2-build --threads 10 hg38.subset.fa hg38.subset
```
_*Indexing full human genome takes ~30 mins (using 10CPU cores)._

<br>

#### 2. Align reads

The `bowtie2` aligner takes the index (generated in previous step) and a set of sequencing read files and outputs the alignment in SAM format. 

```
# USAGE: 
# bowtie2 [options]* -x <bt2_index_basename> -1 <R1.fastq> -2 <R2.fastq> -S <output.sam>
# 
# For more help:
# bowtie2 <ENTER>

bowtie2 -p 10 -x ref/hg38.subset -1 sample/SRR622461_1.fastq -2 sample/SRR622461_2.fastq -S NA12878-hg38.subset.sam
```
This command aligns the forward (R1) and reverse (R2) reads to the indexed hg38 reference genome using _10_ threads and writes the output to `NA12878-hg38.subset.sam` SAM file. This step will take ~3 mins.

<br>

#### Relinquish allocations  

```
exit
```

***

#### Scheduling your job using SLURM

Alternatively, you can schedule the alignment job using a SLURM script.  

**Genomes Repository on Rivanna:**<br> 
Rivanna users have access to a set of ready-to-use reference sequences and annotations for commonly analyzed organisms in a convenient, structured location - 
```
/project/genomes/
```
Each organism parent directory contains assembly builds and corresponding annotations from Ensembl, NCBI and UCSC, along with index files for use with popular aligners like BWA, Bowtie2, STAR2.<br>
[Learn More](https://somrc.virginia.edu/userinfo/bioinfo-on-rivanna/)

<br>

For this step, we will align our reads to the complete pre-indexed hg38 genome. Create an empty file `bowtie2.slurm`, add the following code chunk to the file -
```
#!/bin/bash
#SBATCH --job-name=bowtie2-aln      # Job name
#SBATCH --cpus-per-task=20          # Number of CPU cores per task
#SBATCH --mem=20gb                  # Job Memory
#SBATCH --time=05:00:00             # Time limit hrs:min:sec
#SBATCH --output=bowtie2-aln_%A.out # Standard output log
#SBATCH --error=bowtie2-aln_%A.err  # Standard error log
#SBATCH -A somrc-hpc-workshop       # allocation groups
#SBATCH -p standard                 # slurm queue

pwd; hostname; date

### load bowtie2 module
module purge
module load bowtie2

### Align the reads
bowtie2 -x /project/genomes/Homo_sapiens/UCSC/hg38/Sequence/Bowtie2Index/genome \
	-1 /scratch/<mst3k>/ngs-aln-workshop/sample/SRR622461_1.fastq \
	-2 /scratch/<mst3k>/ngs-aln-workshop/sample/SRR622461_1.fastq \
	-p 20 \
	-S /scratch/<mst3k>/ngs-aln-workshop/NA12878-hg38.sam	 

date
```
Submit your job - 
```
sbatch bowtie2.slurm
```
Monitor the progress - 
```
squeue -u <mst3k>
```

***

### Sequence Alignment/Map Format (SAM)

**[SAM Format](https://samtools.github.io/hts-specs/SAMv1.pdf)**

Lets explore the outputs from alignmnet step - 
```
less -S NA12878-hg38.subset.sam
```

<br>

#### **[SAMTools](https://github.com/samtools/samtools)**  

SAMTools provide various utilities for manipulating alignments in the SAM format, including sorting, merging, indexing and generating alignments in a per-position format.

**Load `SAMTools` module**
```
module load samtools
```

Check out various samtools commands and options for them - 
```
samtools <ENTER>
samtools view <ENTER>
samtools index <ENTER>
```
<br>

**Convert SAM to BAM**
```
samtools view -hSb NA12878-hg38.subset.sam > NA12878-hg38.subset.bam
### OR ###
samtools view -hSbo NA12878-hg38.subset.bam NA12878-hg38.subset.sam 
```

**Sort BAM file on coordinates**
```
samtools sort -o NA12878-hg38.subset.sorted.bam NA12878-hg38.subset.bam
```

**Index BAM**
```
samtools index NA12878-hg38.subset.sorted.bam
```

**Picard Tools**  
The above 3 steps can also be performed using [Picard](https://broadinstitute.github.io/picard/)
```
module load picard

java -jar $EBROOTPICARD/picard.jar SortSam \
  I=NA12878-hg38.subset.sam \
  O=NA12878-hg38.subset.sorted-pct.bam \
  SORT_ORDER=coordinate \
  CREATE_INDEX=true
```

**Filter BAM**  

By region of interest - 
```
samtools view -h NA12878-hg38.subset.sorted.bam chr15 | less -S

samtools view -h NA12878-hg38.subset.sorted.bam chr22:10,500,000-10,750,000 | less -S

samtools view -h NA12878-hg38.subset.sorted.bam chr22:10,500,000-10,750,000 chr5:10,000-15,000 | less -S 
```

By alignment flag - 
```
# filter forward reads that mapped as proper pairs
samtools view -hf 67 NA12878-hg38.subset.sorted.bam | less -S 

# filter reverse reads that mapped as proper pairs
samtools view -hf 131 NA12878-hg38.subset.sorted.bam | less -S 

# filter all unmapped reads
samtools view -hf 4 NA12878-hg38.subset.sorted.bam | less -S

# reverse the selection 
samtools view -hF 4 NA12878-hg38.subset.sorted.bam | less -S
```

[Explain SAM Flags](https://broadinstitute.github.io/picard/explain-flags.html)


**Flagstat**  
```
samtools flagstat NA12878-hg38.subset.sorted.bam
```

**BAM to FASTQ**
```
samtools view -bhf 3 NA12878-hg38.subset.sorted.bam chr5 > NA12878-hg38.subset.sorted.flag3-chr5.bam
	
samtools sort -no NA12878-hg38.subset.sorted.flag3-chr5.sortedByName.bam NA12878-hg38.subset.sorted.flag3-chr5.bam

samtools fastq -1 NA12878-hg38.subset.sorted.flag3-chr5.R1.fastq \
  -2 NA12878-hg38.subset.sorted.flag3-chr5.R2.fastq \
  NA12878-hg38.subset.sorted.flag3-chr5.sortedByName.bam
```

**Genome Coverage**

[BEDTools `genomecov`](https://bedtools.readthedocs.io/en/latest/content/tools/genomecov.html)

```
# load bedtools module
module load bedtools

# First lets create a bed file for our mapped region
samtools view -H NA12878-hg38.subset.sorted.bam | grep -P '^@SQ' | awk '{print substr($2,4,5)"\t"substr($3,4,9)}' > genome.bed

# Compute the genome-wide coverage
genomeCoverageBed -ibam NA12878-hg38.subset.sorted.bam -g genome.bed > coverage.txt
```


***

### Call Variants 

We will now find locations where the reads are different from the genome, using the Bayesian variant caller - `samtools mpileup`, in conjunction with `bcftools`.<br>  
Note: `samtools` collects summary information in the input BAMs, computes the likelihood of data given each possible genotype and stores the likelihoods in the BCF format. It does not call variants! `bcftools` takes that information and does the actual calling. 
	
```
module load bcftools

samtools mpileup -ut DP -d 8000 -f ref/hg38.subset.fa NA12878-hg38.subset.sorted.bam > NA12878-hg38.subset.sorted.mpileup.bcf

bcftools call -cv NA12878-hg38.subset.sorted.mpileup.bcf > NA12878-hg38.subset.sorted.mpileup.raw.vcf

vcfutils.pl varFilter NA12878-hg38.subset.sorted.mpileup.raw.vcf > NA12878-hg38.subset.sorted.mpileup.flt.vcf
```
	
**[VCF Specifications](https://samtools.github.io/hts-specs/VCFv4.2.pdf)**  

***

### Visualize BAM/VCF  

We will use [IGV](https://software.broadinstitute.org/software/igv/home) to visualize our alignment results. Download from [here](https://software.broadinstitute.org/software/igv/download).  
Copy the bam file (and the index) to your local computer. <br>

On your laptop - 
```
scp <mst3k>@rivanna.hpc.virginia.edu:/scratch/<mst3k>/ngs-aln-workshop/NA12878-hg38.subset.sorted.bam ./
scp <mst3k>@rivanna.hpc.virginia.edu:/scratch/<mst3k>/ngs-aln-workshop/NA12878-hg38.subset.sorted.bam.bai ./
scp <mst3k>@rivanna.hpc.virginia.edu:/scratch/<mst3k>/ngs-aln-workshop/NA12878-hg38.subset.sorted.mpileup.flt.vcf ./
```

Lets explore!!!
