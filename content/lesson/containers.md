---
title: "Introduction to Containers"
author: "Neal Magee"
# date: 2015-07-23T21:13:14-05:00
categories: ["Advanced Research Computing"]
---

<p class="lead">In this workshop you will learn how to create and use containers. Follow the lab instructions below at your own pace. Please raise your hand or get the attention of an instructor if you have any questions.</p>

## Quick History of Containers

> From Wikipedia: Linux containers is a generic term for an implementation of operating system-level virtualization for the Linux operating system. Currently, a number of such implementations exist, and they are all based on the virtualization, isolation, and resource management mechanisms provided by the Linux kernel, notably Linux namespaces and cgroups.

Docker is the most widely-available and user-friendly implementation of containers for users, but LXC has existed as a Linux core project for over ten years. In the realm of HPC, users can use an adapted implementation named Singularity. 

## Install Docker

Docker is available for Windows, Mac, and Linux. Download the appropriate Docker Edition for your platform directly from Docker. We suggest the CE "Community Edition."

{{< button "Download Docker" "https://www.docker.com/" >}}


## Docker Commands

1. Make sure Docker is running. You should see an icon in your toolbar that indicates Docker's status.
2. Open a terminal or command-line prompt for the following steps.
3. Docker command reference. This will show you all possible commands:

```
docker
```

4. List all container images you have downloaded:

```
docker images
```

Chances are that if you just installed Docker, you have no images. Let's pull one down.

5. Let's pull the `nginx` web server container:

```
docker pull nginx
```

6. Now list the container images you have downloaded. You should see the nginx image:

```
docker images

REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
nginx               latest              6b914bbcb89e        3 months ago        182 MB
```

7. Run that container image:

```
docker run -d nginx
```

8. View all running containers:

```
docker ps -a

CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                    PORTS                    NAMES
1d17f542be53        rocker/rstudio      "/init"                  18 hours ago        Up 18 hours               0.0.0.0:8787->8787/tcp   elegant_banach
```

9. Stop a container:

```
docker stop 1d17f
```

10. Remove a container image:

```
docker rmi nginx
```

## Running Containers

11. **Detached and Interactive Modes** - Notice that in the earlier `nginx` example, you ran it with the `-d` flag, which means the container runs independently in detached or daemon mode. The other option is to run it in interactive mode, which is equivalent to logging into the container and working from within it.

Detached mode:

```
docker run -d nginx
```

```
docker run -it nginx /bin/bash
root@7ee278e39202:/#
```

Interactive mode requires that you specify a shell to enter, in this case the common `bash` shell. Note that the command immediately drops you into the shell session. Type `exit` to leave the container.

12. **Ports** - You may want to expose the container to a specific port locally, so that you can interact with it.
For example, if you wanted to expose nginx locally over port 80, enter this:

```
docker run -d -p 8080:80 nginx
```

The -p 8080:80 flag maps your local computer's port 8080 with the container's port 80. Browse to http://localhost:8080/ and see the results.

**BONUS** - Map your container to a different port and test the results. Remember that the `nginx` container will always listen for requests on port 80.

13. **Volumes** - Another useful flag for runtime is a volume mapping, so that your running container can read or write to portions of your local computer's filesystem.
So, extending the earlier command:

```
docker run -d -p 8080:80 -v /User/local/dir:/var/www/html nginx
```

## Creating Containers

If you cannot find just the right container, you can always build your own. There are two ways to do this:

1. **Pull Images and Customize** - Download a container image, run it and log into it, and customize as if it were your own custom virtual machine. Then, save the container for later deployment. Instructions for interactively logging into a container can be found above.

    * Pull a base container you want to start with, such as Ubuntu, CentOS, Amazon Linux, Yocto, etc.

    * Run the container interactively so that you can install packages and code, and customize the image from within.

    * Finally, when you exit the container and stop it, save it using the  [`docker commit`](https://docs.docker.com/engine/reference/commandline/commit/)  command. At this point your updated container is versioned (much like a git repository) and can be pushed to Docker Hub if you want to share or store it.

```
docker login
docker tag <IMAGE_ID> <USERNAME>/mycontainer:devel
docker push <USERNAME>/mycontainer
```

2. **Write your own Dockerfile** - Alternatively, you can write a custom `Dockerfile` and build the container from scratch, using `docker build`. More on Docker files and builds can be found at https://docs.docker.com/engine/getstarted/step_four/. This allows Dockerfiles to be shared as snippets of code rather than as full container images, comparable to a bootstrapping script you might use when instantiating a virtual server instance.

    **Step 1** - Create a text file called `Dockerfile` with contents such as:

```
# Use an official Python runtime as a base image
FROM python:2.7-slim

# Who maintains this image
MAINTAINER Neal Magee "nmagee@virginia.edu"

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# or add just a single file from the current directory into /app
ADD myscript.sh /app/

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt
RUN pip install awscli boto3

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variables
ENV NAME World
ENV NEXTID 12345

# Run app.py when the container launches
# Note that each command and parameter must be isolated.
CMD ["python", "app.py"]
```

* **Step 2** - Then build your container based on your `Dockerfile`:

```
docker build -t mycontainer .
```


## Example: Build your own Cowsay

First, create a new directory and hop into it. Then create a file named `docker.cow` and enter this code:

```
##
## Docker Cow
##
$the_cow = <<EOC;
    $thoughts
     $thoughts
      $thoughts
EOC
$the_cow .= <<'EOC';
                    ##         .
              ## ## ##        ==
           ## ## ## ## ##    ===
       /"""""""""""""""""\___/ ===
      {                       /  ===-
       \______ O           __/
         \    \         __/
          \____\_______/

EOC
```

3. Create another file named `Dockerfile` and enter something like this:

```
FROM ubuntu:14.04

# install cowsay, and move the "default.cow" out of the way so we can overwrite it with "docker.cow"
RUN apt-get update && apt-get install -y cowsay --no-install-recommends && rm -rf /var/lib/apt/lists/* \
    && mv /usr/share/cowsay/cows/default.cow /usr/share/cowsay/cows/orig-default.cow

# "cowsay" installs to /usr/games
ENV PATH $PATH:/usr/games

COPY docker.cow /usr/share/cowsay/cows/
RUN ln -sv /usr/share/cowsay/cows/docker.cow /usr/share/cowsay/cows/default.cow

CMD ["cowsay"]
```

4. Build the container with a name
5. Run the container with your command and a parameter:

```
docker run <image-name> cowsay Hello there!
```

## Reference

```
Usage:	docker COMMAND

A self-sufficient runtime for containers

Options:
      --config string      Location of client config files (default "/Users/nem2p/.docker")
  -D, --debug              Enable debug mode
      --help               Print usage
  -H, --host list          Daemon socket(s) to connect to
  -l, --log-level string   Set the logging level ("debug"|"info"|"warn"|"error"|"fatal") (default "info")
      --tls                Use TLS; implied by --tlsverify
      --tlscacert string   Trust certs signed only by this CA (default "/Users/nem2p/.docker/ca.pem")
      --tlscert string     Path to TLS certificate file (default "/Users/nem2p/.docker/cert.pem")
      --tlskey string      Path to TLS key file (default "/Users/nem2p/.docker/key.pem")
      --tlsverify          Use TLS and verify the remote
  -v, --version            Print version information and quit

Management Commands:
  checkpoint  Manage checkpoints
  config      Manage Docker configs
  container   Manage containers
  image       Manage images
  network     Manage networks
  node        Manage Swarm nodes
  plugin      Manage plugins
  secret      Manage Docker secrets
  service     Manage services
  stack       Manage Docker stacks
  swarm       Manage Swarm
  system      Manage Docker
  volume      Manage volumes

Commands:
  attach      Attach local standard input, output, and error streams to a running container
  build       Build an image from a Dockerfile
  commit      Create a new image from a container's changes
  cp          Copy files/folders between a container and the local filesystem
  create      Create a new container
  deploy      Deploy a new stack or update an existing stack
  diff        Inspect changes to files or directories on a container's filesystem
  events      Get real time events from the server
  exec        Run a command in a running container
  export      Export a container's filesystem as a tar archive
  history     Show the history of an image
  images      List images
  import      Import the contents from a tarball to create a filesystem image
  info        Display system-wide information
  inspect     Return low-level information on Docker objects
  kill        Kill one or more running containers
  load        Load an image from a tar archive or STDIN
  login       Log in to a Docker registry
  logout      Log out from a Docker registry
  logs        Fetch the logs of a container
  pause       Pause all processes within one or more containers
  port        List port mappings or a specific mapping for the container
  ps          List containers
  pull        Pull an image or a repository from a registry
  push        Push an image or a repository to a registry
  rename      Rename a container
  restart     Restart one or more containers
  rm          Remove one or more containers
  rmi         Remove one or more images
  run         Run a command in a new container
  save        Save one or more images to a tar archive (streamed to STDOUT by default)
  search      Search the Docker Hub for images
  start       Start one or more stopped containers
  stats       Display a live stream of container(s) resource usage statistics
  stop        Stop one or more running containers
  tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
  top         Display the running processes of a container
  unpause     Unpause all processes within one or more containers
  update      Update configuration of one or more containers
  version     Show the Docker version information
  wait        Block until one or more containers stop, then print their exit codes
```

