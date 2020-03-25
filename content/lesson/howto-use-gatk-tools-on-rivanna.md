 **This guide outlines the steps for using GATK 4.0 tools on Rivanna!**

> **Genome Analysis ToolKit (GATK)** provide tools for variant discovery.  
>
> The GATK is the industry standard for identifying SNPs and indels in germline DNA and RNAseq data. Its scope is now expanding to include somatic short variant calling, and to tackle copy number (CNV) and structural variation (SV). In addition to the variant callers themselves, the GATK also includes many utilities to perform related tasks such as processing and quality control of high-throughput sequencing data, and bundles the popular Picard toolkit.   
>
>**[GATK Homepage](https://software.broadinstitute.org/gatk/)**

**GATK 4.0** : The latest version aims to bring together well-established tools from the **GATK** and **Picard** codebases under a streamlined framework, and to enable selected tools to be run in a massively parallel way on local clusters or in the cloud using Apache Spark. It also contains many newly developed tools not present in earlier releases of the toolkit.

### Load GATK 4.0 module 
GATK4 is available to all Rivanna users as Lmod module:  
```
module load gatk
```
> This makes the **_`gatk`_** wrapper script available to your environment.

_Make sure to invoke GATK using the **`gatk`** wrapper script rather than calling the jar directly, because the wrapper will select the appropriate jar file (there are two!) and will set some parameters for you._

**Help** 
For help on using `gatk` itself, run 
```
gatk --help
```
To print a list of available tools, run 
```
gatk --list
```
To print help for a particular tool, run
```
gatk ToolName --help
```
### General Syntax 
To run a GATK tool locally, the syntax is:
```
gatk ToolName toolArguments
``` 

## Basic Usage Examples

Below are few trivial examples of using GATK4 tools in single-core mode.  

#### 1. [PrintReads](https://software.broadinstitute.org/gatk/documentation/tooldocs/current/org_broadinstitute_hellbender_tools_PrintReads.php)
PrintReads is a generic utility tool for manipulating sequencing data in SAM/BAM format. 

In order to print all reads that have a mapping quality above zero in 2 input BAMs (say - `input1.bam` and `input2.bam`) and write the output to `output.bam` - 
```
gatk PrintReads \
        -I input1.bam \
        -I input2.bam \
        -O output.bam \
        --read_filter MappingQualityZero
``` 

#### 2. [HaplotypeCaller](https://software.broadinstitute.org/gatk/documentation/tooldocs/current/org_broadinstitute_hellbender_tools_walkers_haplotypecaller_HaplotypeCaller.php)
The HaplotypeCaller is capable of calling SNPs and indels simultaneously via local de-novo assembly of haplotypes in an active region.

Basic syntax for variant-only calling on DNAseq - 
```
gatk --java-option "-Xmx4g" HaplotypeCaller \
        -R reference.fasta \
        -I sample1.bam [-I sample2.bam ...] \
        [--dbsnp dbSNP.vcf] \ 
        [-strand_call_conf 30] \
        [-L targets.interval_list] \ 
        -o output.raw.snps.indels.vcf
```
Note: Here, we are setting the maximum Java _heap_ size to 4GB. This argument varies based on the volume of data at-hand. 

> **Tip:** If you are working with human reference genome, please refer the local genome repository on Rivanna at `/project/genomes/Homo_sapiens/` for the `reference.fasta`, as well as the corresponding GATK data bundle at `/project/genomes/Homo_sapiens/GATK_bundle/`, for resource files like the `dbSNP`, `hapmap`, `1000G`. No need to download them to your work-dir! 

If you were to run `HaplotypeCaller` on reference-aligned BAMs for 3 samples (say - `sample1-hg38.bam`, `sample2-hg38.bam` and `sample3-hg38.bam`), accessing files from the Rivanna genomes repo - 
```
gatk --java-option "-Xmx4g" HaplotypeCaller \
        -R /project/genomes/Homo_sapiens/UCSC/hg38/Sequence/WholeGenomeFasta/genome.fa \
        -I sample1-hg38.bam \
        -I sample2-hg38.bam \
        -I sample3-hg38.bam \
        --dbsnp /project/genomes/Homo_sapiens/GATK_bundle/hg38/dbsnp_146.hg38.vcf.gz \ 
        -strand_call_conf 30 \
        -o output.raw.snps.indels.vcf
```
The output will be written to the file - `output.raw.snps.indels.vcf`, in the [Variant Call Format](https://samtools.github.io/hts-specs/VCFv4.2.pdf).

## Parallelism in GATK4 

The concepts involved and their application within GATK are well explained in this [article](https://software.broadinstitute.org/gatk/documentation/article?id=11059). 

In GATK3, there were two options for tools that supported multi-threading, controlled by the arguments `-nt/--num_threads` and `-nct/--num_cpu_threads_per_data_thread`.

In GATK4, tools take advantage of an open-source industry-standard [Apache Spark](https://spark.apache.org/) software library.  

### Spark-enabled GATK tools

**Not all GATK tools use Spark.** Check the respective Tool Doc to make sure of Spark-capabilities.

The "sparkified" versions have the suffix "Spark" at the end of their names. Many of these are still experimental; please carefully check for expected output, and validate against non-spark tools.

**You _DO NOT_ need a Spark cluster to run Spark-enabled GATK tools!** 

While working on Rivanna's compute node (with multiple CPU cores), the GATK engine can use Spark to create a virtual standalone cluster in place, for its multi-threaded processing. 

#### "local"-Spark Usage Example: 
The `PrintReads` tool we explored above has a Spark version called: `PrintReadsSpark`. In order to set up a local Spark environment to run the same job using 8 threads, we can use the `--spark-master` argument - 
```
gatk PrintReadsSpark \
    --spark-master local[8] \
    -I input1.bam \
    -I input2.bam \
    -O output.bam \
    --read_filter MappingQualityZero
```
**Note:** Make sure to request for 8 CPU cores before executing the above command, either by starting an interactive session using `ijob` or by submitting the job via _SLURM_ batch submission script. 

Below is an example `gatk-printReadsSpark.slurm.sh` batch submission script for the above job - 
```
#!/bin/bash
#SBATCH --job-name=gatk-prs			# Job name
#SBATCH --cpus-per-task=8			# Number of CPU cores per task
#SBATCH --mem=10gb					# Job Memory
#SBATCH --time=05:00:00				# Time limit hrs:min:sec
#SBATCH --output=gatk-prs_%A.out	# Standard output log
#SBATCH --error=gatk-prs_%A.err		# Standard error log
#SBATCH -A <ACCOUNT>                # allocation groups
#SBATCH -p standard					# slurm queue

pwd; hostname; date

### load gatk module, to make the wrapper script available for execution
module load gatk

### command
gatk --java-option "-Xmx8G" PrintReadsSpark \
    --spark-master local[8] \
    -I input1.bam \
    -I input2.bam \
    -O output.bam \
    --read_filter MappingQualityZero

date
```
_replace `<ACCOUNT>` with your allocation group._

To submit the job -
```
sbatch gatk-printReadsSpark.slurm.sh
```
To monitor the progress of the job -
```
jobq 
OR
squeue -u <mst3k>
```
_replace `<mst3k>` with your computing ID._


> Currently, Rivanna only supports Single-Node/Local Spark implementation of GATK tools. 


## Documentation 
Please refer the [GATK User Guide](https://software.broadinstitute.org/gatk/documentation/) for all-things GATK, and more!