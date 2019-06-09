---
title: Bioinformatics in a High-Performance Computing Environment
author: "Karsten Siller"
Weight: 1
categories: ["Bioinformatics"]
toc: true
---

## HPC at UVA: Rivanna {#rivanna}

[Rivanna][rivanna] is the University of Virginia's High-Performance Computing (HPC) system. It is open to all faculty, research staff, and graduate students of the University, providing a platform for high-performance parallel jobs, for high-throughput computing chores of up to thousands of jobs, and for large-scale data analysis and image processing.  It also supports accelerator technologies, including general-purpose graphical processing units (GPGPUs) and Intel Many-Integrated Cores Knight's Landing systems. 

## Login to Rivanna {#login}

In order to use Rivanna, you need a Rivanna [allocation][rivanna-allocation]. For this workshop you have been made a member of the `rivanna-training` allocation. 

**Your login credentials are your UVA computing ID and your Eservices password.**

### SSH Terminal {#ssh}

Rivanna is accessible through ssh (Secure Shell) connections using the hostname `rivanna.hpc.virginia.edu`.  

**Windows:** Windows users must install an ssh client application. We recommend [MobXterm](https://mobaxterm.mobatek.net), but you may also use other clients such as SecureCRT or PuTTY. 

**Mac OSX and Linux**: OSX and Linux users may connect through a terminal using the command:
```
ssh -Y mst3k@rivanna.hpc.virginia.edu  
```
Your login credentials are your UVA computing ID and your Eservices password. So in the example above, replace `mst3k` with your computing id.


**Note:** Mac users must install XQuartz in order to be able to run graphical (X11) applications.  Keep in mind that graphical X11 applications may be slow through a standard ssh login.  For extensive use of graphical applications you may prefer the [FastX remote desktop environment](#fastx).

<br>

### Remote Desktop Environment: FastX {#fastx}

Users who wish to run X11 graphical applications may prefer the FastX remote desktop web interface.  The FastX web client is accessible at https://rivanna-desktop.hpc.virginia.edu.  Your login credentials are your UVA computing ID and your Eservices password.

Detailed instructions for using FastX Web can be found [here](https://arcs.virginia.edu/fastx).

<br>

## Linux Commands {#commandline}

An introduction to basic and useful Linux commands can be found [here](../command-line).  Ignore the **Connect** section on that site since we are connecting to Rivanna for this workshop.

<br>

## File Transfer Tools {#file-transfer}

### Command Line Tools {#cli}

<br>

### Web Client: Globus {#globus}

<br>

## Bioinformatics Software & Tools{#bio-software}

### Finding and Using Software {#modules}

A complete list of the available software on Rivanna can be found [here][complete-software].

### Available Software on Rivanna

**Sequence Manipulation**

| Software | version | URL|
| --- | --- | ---|
| bcl2fastq2 | 2.20 | https://support.illumina.com/sequencing/sequencing_software/bcl2fastq-conversion-software.html
| cutadapt | 1.16 | https://cutadapt.readthedocs.io/
| fastqc | 0.11.5 | https://www.bioinformatics.babraham.ac.uk/projects/fastqc/
| trimgalore | 0.4.5 | https://github.com/FelixKrueger/TrimGalore/blob/master/Docs/Trim_Galore_User_Guide.md
| trimmomatic | 0.36 | http://www.usadellab.org/cms/?page=trimmomatic

<br>

**Utility Toolkits**

| Software | version | URL|
| --- | --- | ---|
| bamtools | 2.5.1 | https://github.com/pezmaster31/bamtools | 
| bcftools | 1.9 | http://samtools.github.io/bcftools/
| bedtools | 2.26 | https://bedtools.readthedocs.io/en/latest/
| bedops | 2.4.1 | https://github.com/bedops/bedops
| emboss | 6.6 | http://emboss.sourceforge.net/
| hstlib | 1.9 | http://www.htslib.org/
| picard | 2.18.5 | https://broadinstitute.github.io/picard/
| sambamba | 0.6.6 | https://github.com/biod/sambamba
| samtools | 1.9 | http://samtools.sourceforge.net/
| sratoolkit | 2.9.1 | https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=software
| vcftools | 0.1.15 | https://vcftools.github.io/index.html

<br>

**Aligners**

| Software | version | URL|
| --- | --- | ---|
| blast+ | 2.6.0 | https://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Web&PAGE_TYPE=BlastDocs&DOC_TYPE=Download
| bwa | 0.7.17 | http://bio-bwa.sourceforge.net/
| bowtie2 | 2.2.9 | http://bowtie-bio.sourceforge.net/bowtie2/index.shtml
| cd-hit | 4.6.7 | https://github.com/weizhongli/cdhit
| diamond | 0.9.13 | https://github.com/bbuchfink/diamond
| fsa | 1.15.9 | http://fsa.sourceforge.net
| hisat2 | 2.1.0 | https://ccb.jhu.edu/software/hisat2/index.shtml
| mummer | 4.0.0 | https://github.com/mummer4/mummer
| muscle | 3.8.31 | http://drive5.com/muscle/
| star	| 2.5.3a | https://github.com/alexdobin/STAR
| vsearch | 2.7.1 | https://github.com/torognes/vsearch

<br>

**Variant Callers**

| Software | version | URL|
| --- | --- | ---|
| freebayes | 0.9.9 | https://github.com/ekg/freebayes
| gatk | 4.0.0.0 | https://software.broadinstitute.org/gatk/
| vep | 90 | http://www.ensembl.org/info/docs/tools/vep/index.html

<br>

**Structural Variant Analyzers**

| Software | version | URL|
| --- | --- | ---|
| longranger | 2.2.2 | https://support.10xgenomics.com/genome-exome/software/pipelines/latest/what-is-long-ranger
| manta	| 1.4.0 |https://github.com/Illumina/manta
| vep | 90 | http://www.ensembl.org/info/docs/tools/vep/index.html

<br>

**RNA-Seq Analysis**

| Software | version | URL|
| --- | --- | ---|
| kallisto | 0.44.0 | https://pachterlab.github.io/kallisto/
| salmon | 0.11.2 | https://combine-lab.github.io/salmon/
| cufflinks (deprecated) | 2.2.1 | http://cole-trapnell-lab.github.io/cufflinks/

<br>

**ChIP-Seq Analysis**

| Software | version | URL|
| --- | --- | ---|
| bart | 1.0.1 | http://faculty.virginia.edu/zanglab/bart/index.htm |
| epic | 0.2.9 | https://github.com/biocore-ntnu/epic |
| idr | 2.0.2 | https://github.com/nboley/idr |
| macs2 | 2.1.2 | https://github.com/taoliu/MACS |
| marge | 1.0 | http://cistrome.org/MARGE/ |
| peakseq | 1.31 | http://info.gersteinlab.org/PeakSeq |

<br>

**Assembly Tools**

| Software | version | URL|
| --- | --- | ---|
| soapdenovo2 | r240 | http://soap.genomics.org.cn/index.html
| velvet | 1.2.10 | https://www.ebi.ac.uk/~zerbino/velvet/

<br>

**Metagenomics Tools**

| Software | version | URL|
| --- | --- | ---|
| kraken | 2.0.7 | https://ccb.jhu.edu/software/kraken/
| centrifuge | 1.0.3 | https://ccb.jhu.edu/software/centrifuge/
| qiime | 1.9.1 | https://docs.qiime2.org/2019.1/interfaces/q2cli/
| rdp-classifier | 2.12 | https://sourceforge.net/projects/rdp-classifier/files/rdp-classifier/
| mothur | 1.39.5 | *not actively developed https://www.mothur.org/
| prokka | 1.12 | *has lots of dependencies	https://github.com/tseemann/prokka
| raxml | 8.2.4 | https://github.com/stamatak/standard-RAxML

<br>

**Motif Search**

| Software | version | URL|
| --- | --- | ---|
| ascmeme | devel | https://sites.cs.ucsb.edu/~honglei/abp/index.htm
| meme | 4.10.2 | http://meme-suite.org

<br>

**Annotation Tools**

| Software | version | URL|
| --- | --- | ---|
| vep | 90 | http://useast.ensembl.org/info/docs/tools/vep/index.html

<br>

**Visualization**

| Software | version | URL|
| --- | --- | ---|
| igv| | https://software.broadinstitute.org/software/igv/
| circos | 0.69.5 | http://www.circos.ca/software/download/

<br>

**Language-Specific Libraries**

| Software | version | URL|
| --- | --- | ---|
| biopython | 1.70 | https://biopython.org
| bioperl | 1.7.1 | https://bioperl.org

<br>

**Miscellaneous**

| Software | version | URL|
| --- | --- | ---|
| bismark | 0.21.0 | http://www.bioinformatics.babraham.ac.uk/projects/bismark/
| plink | 1.0.7 | https://www.cog-genomics.org/plink2
| multiqc | 1.7 | https://multiqc.info/
| cellranger | 3.0.2 | https://github.com/10XGenomics/cellranger

<br>

## Running Bioinformatics Analyses on Rivanna {#hpc-bio}

### Next-Generation Sequence Alignment {#ngs-analysis}

Examples for running Next-Generation Sequence Analyses on Rivanna can be found [here](../ngs-seq-alignment).

 
[rivanna]: https://arcs.virginia.edu/rivanna
[rivanna-allocation]: https://arcs.virginia.edu/allocations
[complete-software]: https://arcs.virginia.edu/software-list
