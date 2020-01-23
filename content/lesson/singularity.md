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

# Hands-On 1: Create and run image from Container Library
---
*Objectives:*

- URIs supported by Singularity and syntax
- Pull an image from Container Library
- Verify, inspect, and run an image

---

Command to download an image:
```
singularity pull [<SIF>] <URI>
singularity build <SIF> <URI>
```

#### Unified resource identifiers (URIs) supported by Singularity

| Repository | URI prefix |
|------------|------------|
| [Container Library](https://cloud.sylabs.io/library) | `library://` |
| [Docker Hub](https://hub.docker.com) | `docker://` |
| [Singularity Hub](https://singularity-hub.org) | `shub://` |

<br>

The syntax for `<URI>` is
```
<library|docker|shub>://<user>/<repo-name>[:<tag>]
```

#### Singularity Image Format (SIF)

- Singularity images use the `*.sif` suffix
- Earlier versions use the `*.simg` suffix

#### Differences between `pull` and `build`

|`pull`|`build`|
|------|-------|
| downloads a pre-built image | converts image to the latest Singularity image format after downloading it |
| does not require output image name <SIF> | requires output image name <SIF> |

### Your first container
```
$ singularity pull library://godlovedc/demo/lolcow
INFO:    Downloading library image
 89.24 MiB / 89.24 MiB [==============================================================] 100.00% 60.03 MiB/s 1s
WARNING: Container might not be trusted; run 'singularity verify lolcow_latest.sif' to show who signed it
INFO:    Download complete: lolcow_latest.sif
```
Let's examine this image:
```
$ singularity verify lolcow_latest.sif
Container is signed by 1 key(s):

Verifying partition: FS:
D1799BF5746175CE62EA43A379411A81F643F561
[REMOTE]  Dave Godlove <d@sylabs.io>
[OK]      Data integrity verified

INFO:    Container verified: lolcow_latest.sif
```
```
$ singularity inspect lolcow_latest.sif
WARNING: No SIF metadata partition, searching in container...
org.label-schema.build-date: Thursday_25_October_2018_17:45:4_UTC
org.label-schema.schema-version: 1.0
org.label-schema.usage.singularity.deffile.bootstrap: library
org.label-schema.usage.singularity.deffile.from: ubuntu:16.04
org.label-schema.usage.singularity.version: 3.0.0-218.g093d5f68
```
```
$ singularity run-help lolcow_latest.sif
No help sections were defined for this image
```

Now let's run the image:
```
singularity run <SIF>
./<SIF>
```
(These two commands are equivalent.)

```
$ singularity run lolcow_latest.sif
 ___________________________________
< Beware of low-flying butterflies. >
 -----------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

What command is actually being executed?
```
$ singularity inspect --runscript lolcow_latest.sif
#!/bin/sh

    fortune | cowsay | lolcat
```

#### **Inspect the runscript before running an image!**

<br>

# Hands-On 2: Convert image from Docker

---
*Objectives:*

- Download and convert a Docker image from Docker Hub
- Convert a local Docker image

---

### Pulling from Docker Hub
> Pulling Docker images reduces reproducibility. If you were to pull a Docker image today and then wait six months and pull again, you are not guaranteed to get the same image. If any of the source layers has changed the image will be altered. -- <cite>Singularity 3.5 manual</cite>

```
$ singularity pull lolcow_docker.sif docker://godlovedc/lolcow
```
The `lolcow_docker.sif` image name is optional, but here we specify this to avoid overwriting the existing `lolcow_latest.sif`.


|Further Reading|
|---|
|In this case `pull` and `build` are equivalent. See [here](https://sylabs.io/guides/3.5/user-guide/singularity_and_docker.html#building-images-for-singularity-from-docker-registries) for differences.|

<br>

The `verify` command does not work for SIF files built from Docker images:
```
$ singularity verify lolcow_docker.sif
FATAL:   Failed to verify: lolcow_docker.sif: error while searching for signature blocks: no signatures found for system partition
```


### Converting from local Docker cache (not on Rivanna)

(Taken from Singularity 3.5 manual)

You can convert local Docker images into Singularity (e.g. on your personal computer).
Suppose you have the `godlovedc/lolcow:latest` image cached by Docker:
```
$ sudo docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
godlovedc/lolcow    latest              577c1fe8e6d8        16 months ago       241MB
```
You can build a Singularity image from it via:
```
$ sudo singularity build lolcow_from_docker_cache.sif docker-daemon://godlovedc/lolcow:latest
INFO:    Starting build...
Getting image source signatures
Copying blob sha256:a2022691bf950a72f9d2d84d557183cb9eee07c065a76485f1695784855c5193
 119.83 MiB / 119.83 MiB [==================================================] 6s
Copying blob sha256:ae620432889d2553535199dbdd8ba5a264ce85fcdcd5a430974d81fc27c02b45
 15.50 KiB / 15.50 KiB [====================================================] 0s
Copying blob sha256:c561538251751e3685c7c6e7479d488745455ad7f84e842019dcb452c7b6fecc
 14.50 KiB / 14.50 KiB [====================================================] 0s
Copying blob sha256:f96e6b25195f1b36ad02598b5d4381e41997c93ce6170cab1b81d9c68c514db0
 5.50 KiB / 5.50 KiB [======================================================] 0s
Copying blob sha256:7f7a065d245a6501a782bf674f4d7e9d0a62fa6bd212edbf1f17bad0d5cd0bfc
 3.00 KiB / 3.00 KiB [======================================================] 0s
Copying blob sha256:70ca7d49f8e9c44705431e3dade0636a2156300ae646ff4f09c904c138728839
 116.56 MiB / 116.56 MiB [==================================================] 6s
Copying config sha256:73d5b1025fbfa138f2cacf45bbf3f61f7de891559fa25b28ab365c7d9c3cbd82
 3.33 KiB / 3.33 KiB [======================================================] 0s
Writing manifest to image destination
Storing signatures
INFO:    Creating SIF file...
INFO:    Build complete: lolcow_from_docker_cache.sif
```

Note that this requires `sudo` privilege.

<br>

# Hands-On 3: Other ways to run a container

---
*Objectives:*

- Use a Singularity image interactively in its shell
- File system
- Bind paths
- Run a custom command

---

You can run a shell within a container:

```
$ singularity shell lolcow_latest.sif
Singularity>
```

Note the change in the shell prompt. You are now inside the container. Let's take a look at the file system.

```
Singularity> ls -l /
total 565
drwxr-xr-x    2 root  root      1279 Oct 25  2018 bin
drwxr-xr-x    2 root  root         3 Oct 25  2018 boot
drwxr-xr-x   22 root  root      3380 Jan  3 00:28 dev
lrwxrwxrwx    1 root  root        36 Jan 23 13:57 environment -> .singularity.d/env/90-environment.sh
drwxr-xr-x   51 root  root      1642 Oct 25  2018 etc
drwxr-xr-x    1 rs7wz users       60 Jan 23 13:58 home
drwxr-xr-x    9 root  root       145 Oct 25  2018 lib
drwxr-xr-x    2 root  root        43 Oct 25  2018 lib64
drwxr-xr-x    2 root  root         3 Oct 25  2018 media
drwxr-xr-x    2 root  root         3 Oct 25  2018 mnt
drwxr-xr-x   14 root  root         0 Jan 23 13:46 nv
drwxr-xr-x    2 root  root         3 Oct 25  2018 opt
dr-xr-xr-x  838 root  root         0 Oct 31 05:16 proc
dr-xr-xr-x   89 root  nogroup  45056 Jan 22 09:05 project
drwx------    2 root  root        46 Oct 25  2018 root
drwxr-xr-x    5 root  root        67 Oct 25  2018 run
drwxr-xr-x    2 root  root      1505 Oct 25  2018 sbin
drwxr-xr-x 4314 root  root    565760 Jan 23 11:20 scratch
drwxr-xr-x    3 rs7wz users       60 Jan 23 13:58 sfs
drwxr-xr-x    3 rs7wz users       60 Jan 23 13:58 share
lrwxrwxrwx    1 root  root        24 Jan 23 13:57 singularity -> .singularity.d/runscript
drwxr-xr-x    2 root  root         3 Oct 25  2018 srv
dr-xr-xr-x   13 root  root         0 Nov 13 09:41 sys
drwxrwxrwt   94 root  root      5100 Jan 23 13:58 tmp
drwxr-xr-x    1 rs7wz users       60 Jan 23 13:58 usr
drwxr-xr-x   11 root  root       160 Oct 25  2018 var
```

On Rivanna, the following host directories are accessible inside the container:

- Personal directories: `/home`, `/scratch`
- Leased storage shared by your research group: `/project`, `/nv`
- Some system directories: `/tmp`, `/sys`, `/proc`, `/dev`, `/usr`
- Your current working directory (if it is not a system directory)

Singularity bind mounts these directories at runtime. 
Other directories inside the container are owned by `root` and you cannot modify them.

**Exercise:** Run `ls -l` for your home directory both inside and outside the container. Verify that you see the same results. To exit the container shell, type `exit`.

<details><summary>Show command</summary>
```
$ singularity shell lolcow_latest.sif
Singularity> ls /home/$USER   # or ls ~
...
Singularity> exit
$ ls /home/$USER              # or ls ~
```
</p>
</details>

**Exercise:** View the content of `/etc/os-release` both inside and outside the container. Are they the same or different? Why?

<details><summary>Show command</summary>
```
$ singularity shell lolcow_latest.sif
Singularity> cat /etc/os-release
Singularity> cat /etc/os-release
NAME="Ubuntu"
VERSION="16.04.5 LTS (Xenial Xerus)"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu 16.04.5 LTS"
VERSION_ID="16.04"
HOME_URL="http://www.ubuntu.com/"
SUPPORT_URL="http://help.ubuntu.com/"
BUG_REPORT_URL="http://bugs.launchpad.net/ubuntu/"
VERSION_CODENAME=xenial
UBUNTU_CODENAME=xenial
Singularity> exit
$ cat /etc/os-release
NAME="CentOS Linux"
VERSION="7 (Core)"
ID="centos"
ID_LIKE="rhel fedora"
VERSION_ID="7"
PRETTY_NAME="CentOS Linux 7 (Core)"
ANSI_COLOR="0;31"
CPE_NAME="cpe:/o:centos:centos:7"
HOME_URL="https://www.centos.org/"
BUG_REPORT_URL="https://bugs.centos.org/"

CENTOS_MANTISBT_PROJECT="CentOS-7"
CENTOS_MANTISBT_PROJECT_VERSION="7"
REDHAT_SUPPORT_PRODUCT="centos"
REDHAT_SUPPORT_PRODUCT_VERSION="7"
```
</p>
</details>

To bind mount additional directories/files from the host, use `--bind` or `-B`:

```
$ singularity <run|shell|exec> -B <host_path>:<container_path> <SIF>
```

**Exercise:** Bind your scratch directory `/scratch/$USER` to `/scratch` and verify the contents.

<details><summary>Show command</summary>
```
$ singularity shell -B /scratch/$USER:/scratch lolcow_latest.sif
Singularity> ls /scratch
...
Singularity> exit
$ ls /scratch/$USER
```
</p>
</details>

To disable the default binding:
```
$ singularity shell -c lolcow_latest.sif
Singularity> ls /home/$USER
Singularity>
```
