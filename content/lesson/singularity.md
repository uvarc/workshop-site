---
title: "Software Containers for HPC Environments"
author: "Ruoshi Sun"
# date: 2020-01-22T00:00:00-05:00
categories: ["Advanced Research Computing"]
toc: true
---

<p class="lead">In this workshop you will learn how to create and use software containers within an HPC environment (Rivanna). We will discuss Docker (briefly) and Singularity (in more depth).</p>

---
# Introduction
## What is a software container?

> A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another. -- <cite>Docker</cite>

A container bundles an **application**, the **libraries** and other **executables** that are needed, and even the **data** used with the application, into a *portable*, *self-contained* file called **image**.

## Why use software containers?
#### **Simple**
Containers simplify software installation and management.
#### **Portable** 
You can build an image on one machine and run it on another.
#### **Reproducible** 
Versioning and freezing of containers enable data reproducibility.

### Why use Singularity?
It is designed for **HPC environments**:

- Does not require sudo privilege to run (unlike Docker)
- Interoperates well with HPC resource managers in multi-node environments
- Easily makes use of GPUs, high speed networks, parallel filesystems on a cluster or server by default
- Able to convert Docker images into Singularity

---
# Rivanna Crash Course
It is assumed that students of this workshop:

- are comfortable with the Linux command line
- have access to Rivanna

## Access
(Demo if needed)

1. Terminal (e.g., Mac Terminal, [MobaXterm](https://mobaxterm.mobatek.net/download-home-edition.html), [PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/))<br/>```ssh <your_user_id>@rivanna.hpc.virginia.edu```

2. [FastX Web](https://rivanna-portal.hpc.virginia.edu)

See [here](https://www.rc.virginia.edu/userinfo/rivanna/login/) for more information.

## Commands

### SLURM allocation
For workshop allocations, use **rivanna-training**.

```
$ allocations

Allocations available to Ruoshi_Sun (rs7wz):

 * arcs_admin: less than 500 service-units remaining
 * ds5559: less than 25,000 service-units remaining
 * hpc_build: less than 203,417 service-units remaining
 * rivanna-training: less than 10,000 service-units remaining
```

### Module
To use software installed on Rivanna, use **module**.
```
$ module spider singularity

--------------------------------------------------------------------------------------------------------
  singularity:
--------------------------------------------------------------------------------------------------------
    Description:
      Singularity enables users to have full control of their environment. Singularity containers can
      be used to package entire scientific workflows, software and libraries, and even data.

     Versions:
        singularity/2.6.1
        singularity/3.1.1
        singularity/3.5.2
```

Earlier versions will be decommissioned, so please use Singularity **version 3.5.2**.
```
$ module load singularity/3.5.2
$ module avail

--------------------------- /apps/modulefiles/standard/container/singularity/3.5.2 ---------------------------
   cellprofiler/2.2.0        danpos/2.2.2       patric/1.026              tensorflow/2.0.0-py36 (D)
   cellprofiler/3.1.8 (D)    hydrator/0.0.2     tensorflow/1.12.0-py27
   cp-analyst/2.2.1          inkscape/0.92.3    tensorflow/1.12.0-py36
```

The above modules can now be loaded. For example:
```
$ module load tensorflow/2.0.0-py36 
Before using this container for the FIRST time, copy it to your personal home (or /scratch) directory using this command:
cp $CONTAINERDIR/tensorflow-2.0.0-py36.sif /home/$USER

To execute the default application inside the container, run this command:
singularity run --nv /home/$USER/tensorflow-2.0.0-py36.sif
```

---
# Singularity Overview

### Create
1. Download from a repository: `pull`/`build`
2. Convert from Docker: `pull`/`build`
3. Build from definition file: `build`

### Inspect
1. Show metadata: `inspect`
2. Show user-defined help: `run-help`
3. Verify cryptographic signatures: `verify` 

### Run
1. Run the user-defined default command: `run`
2. Run a shell interactively within the container: `shell`
3. Run a command within the container: `exec`

# Create Image

## 1. Download from a repository

```
singularity pull <URI>
singularity build <SIF> <URI>
```

#### Supported unified resource identifiers (URIs)

- [Container Library](https://cloud.sylabs.io/library) `library://`
- [Docker Hub](https://hub.docker.com) `docker://`
- [Singularity Hub](https://singularity-hub.org) `shub://`

#### Singularity Image Format (SIF)

- Singularity images use the `*.sif` suffix
- Earlier versions use the `*.simg` suffix

#### Difference between `pull` and `build`

- `pull` downloads a pre-built image.
- `build` converts the image to the latest Singularity image format after downloading it.

### Example: your first container
```
singularity pull 
