# What
A minimal docker container for GCC ARM Embedded toolchain.

# Why
Use a sandbox instead of updating the state of your entire work machine and avoid (potentially) breaking something unrelated.

# How to use
  * Install Docker [https://docs.docker.com/installation/ubuntulinux/]
  * Build the docker image
  * Create a container with mapped volume from your workspace
  * Start docker container & use ssh or invoke container directly to execute scripts.
  * Download and extract gcc arm toolchain anywhere in workspace tree. [https://launchpad.net/gcc-arm-embedded]

# Shell commands
Following are all the commands you should need to use this container. Note the --volume arguments, adjust your host path as needed.

```bash
# build the image
docker build --tag image-gccarm:v0.01 .

# ceate a container, adjust --volume args
docker create \
    --name mygccarm \
    --publish 8022:22 \
    --volume /home/wahoo/workspace/:/home/wahoo/workspace \
    image-gccarm:v0.01

# start the container
docker start mygccarm

# ssh into it
ssh -p 8022 wahoo@localhost

# stop the container
docker stop mygccarm

# delete the container and image, if you don't need these anymore
docker rm mygccarm
docker rmi image-gccarm:v0.01
```

# Getting gcc-arm tools
  * download and install linux binary from https://launchpad.net/gcc-arm-embedded/+download
  * wget & tar xvf on workspace somwehere
  * Add /home/wahoo/workspace/launchpad.gnu-arm/gcc-arm-none-eabi-4_9-2015q2/bin to $PATH.

# Status
This docker has been tested on Ubuntu 14.04LTS, 64bit environment.

# Licenese
MIT. See LICENSE file.
