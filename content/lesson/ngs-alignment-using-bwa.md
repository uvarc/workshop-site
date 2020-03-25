**This is a step-by-step guide on how to use BWA on Rivanna.**  

> **Burrows-Wheeler Alignment (BWA) Tool** - BWA is a software package for mapping low-divergent sequences against a large reference genome, such as the human genome.

It consists of three algorithms: BWA-backtrack, BWA-SW and BWA-MEM. The first algorithm is designed for Illumina sequence reads up to 100bp, while the rest two for longer sequences ranged from 70bp to 1Mbp. BWA-MEM and BWA-SW share similar features such as long-read support and split alignment, but BWA-MEM, which is the latest, is generally recommended for high-quality queries as it is faster and more accurate. BWA-MEM also has better performance than BWA-backtrack for 70-100bp Illumina reads.

[BWA Homepage](http://bio-bwa.sourceforge.net/)

### Start an interactive session 
You should **_NOT_** do your computational processing on the head node. In order to obtain a login shell on a compute node, use the `ijob` command - 
```
ijob -A <ACCOUNT> -p standard -c 20 --mem=20gb
```
replace `<ACCOUNT>` with your account name to charge SUs. The arguments for `-c` and `--mem` options depend on the resources you will use for the alignment step!

### Load module
First, lets make bwa executable available to you:
```
module load bwa
```
In order to check all available `bwa` commands: 
```
bwa
```
If you wish to check various options for each command: 
```
bwa index
```
```
bwa mem 
```

### NGS Genomic DNA alignment

Alignment using BWA is a 2-step process: 
1. indexing the reference genome (only needed once!), and 
2. align sequence reads

For this tutorial, we will align paired-end genomic DNA reads `sample_R1.fastq` and `sample_R2.fastq`, to the `hg19` build of the human genome.

#### 1. Index reference genome
Given the reference genome fasta file `hg19.fa` - 
```
bwa index hg19.fa
```
This will create new files with extentions - `.amb`, `.ann`, `.bwt`, `.pac`, `.sa` in the same location as reference fasta file. These files constitute the index. You will never directly reference these files. BWA will know how to find them based on the basename.

**Note:** You only need to index the reference genome once! Skip to Step 2 for all subsequent alignment jobs. 

#### 2. Align reads
Next, we will align the sample data to the reference genome, indexed in the previous step - 
```
bwa mem -M -t <nthreads> <ref-basename> <for-reads> <rev-reads> > <out-sam>
```
Options:
`-M` : mark shorter split hits as secondary (this is required for certain downstream tools like picard, GATK)
`-t <nthreads>` : number of threads (we will use the same number of threads as requested in the `ijob` command)
 `ref-basename` : the basename of (indexed) reference genome fasta file. The index files should be in the same dir
`for-reads` : paired-end forward reads 
`rev-reads` : paired-end reverse reads
`out-sam` : output SAM file

Our command - 
```
bwa mem -M -t 20 hg19.fa sample_R1.fastq sample_R2.fastq > sample.hg19-bwa-mem.sam
```
The resulting file, `sample.hg19-bwa-mem.sam`, is in a Sequence Alignment Map (SAM) format that represents all known information about the sample and its alignment. 
[SAM specifications](https://samtools.github.io/hts-specs/SAMv1.pdf)

### Relinquish allocations

```
exit
```
This will relinquish the allocations on the compute node. **It is extremely important that users exit their interactive sessions as soon as their work is done so that their nodes are returned to the available pool of processors and the user is not charged for unused time.** 


### Using a SLURM batch submission

Alternatively, one can submit the alignment job using a _SLURM_ submission script. Create an empty script file `bwa-mem.slurm.sh` in the same directory as your `hg19.fa` reference genome, and the `sample_R1.fastq` and `sample_R2.fastq` files. Add the following code chunk - 

```
#!/bin/bash
#SBATCH --job-name=bwa-aln			# Job name
#SBATCH --cpus-per-task=20			# Number of CPU cores per task
#SBATCH --mem=20gb					# Job Memory
#SBATCH --time=05:00:00				# Time limit hrs:min:sec
#SBATCH --output=bwa-aln_%A.out		# Standard output log
#SBATCH --error=bwa-aln_%A.err		# Standard error log
#SBATCH -A <ACCOUNT>                # allocation groups
#SBATCH -p standard					# slurm queue

pwd; hostname; date

### load bwa module
module load bwa

### Create the index
bwa index hg19.fa 

### Align the reads
bwa mem -M -t 20 hg19.fa sample_R1.fastq sample_R2.fastq > sample.hg19-bwa-mem.sam

date
```
_replace `<ACCOUNT>` with your allocation group_

To submit the job - 
```
sbatch bwa-mem.slurm.sh
```

To monitor the progress of the job - 
```
jobq 

OR

squeue -u <mst3k>
```

replace `<mst3k>` with your computing ID.

> **Tip** - If you are working with a commonly used genome, like the human / mouse, no need to download / index them. Refer to the genomes repository on Rivanna at `/project/genomes/` for the reference fasta and BWA index files!

### Manual

For detailed information, please refer to the [BWA manual](http://bio-bwa.sourceforge.net/bwa.shtml).

### Citation  
The short read alignment component (bwa-short) has been published:  
Li H. and Durbin R. (2009) Fast and accurate short read alignment with Burrows-Wheeler Transform. Bioinformatics, 25:1754-60. [PMID: 19451168]  

If you use BWA-SW, please cite:  
Li H. and Durbin R. (2010) Fast and accurate long-read alignment with Burrows-Wheeler Transform. Bioinformatics, Epub. [PMID: 20080505]  

If you use BWA-MEM, please cite:  
Li H. (2013) Aligning sequence reads, clone sequences and assembly contigs with BWA-MEM. arXiv:1303.3997v1 [q-bio.GN].