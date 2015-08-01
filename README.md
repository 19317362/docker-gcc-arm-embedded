# docker-gcc-arm-embedded
A docker container for GCC ARM Embedded toolchain

# Why
Use a sandbox instead of updating the state of your entire work machine.

# How to use
  * Install Docker
    https://launchpad.net/gcc-arm-embedded
  * Build the docker image
  * Create a container with mapped volume from your workspace
  * Start docker container & use ssh or invoke container directly to execute scripts.
  * Download and extract gcc arm toolchain anywhere in workspace tree.
    https://launchpad.net/gcc-arm-embedded

docker build --tag image-gccarm:v0.01 .

docker create \
    --name mygccarm \
    --publish 8022:22 \
    --volume /home/wahoo/workspace/:/home/wahoo/workspace \
    image-gccarm:v0.01

docker start mygccarm

ssh -p 8022 wahoo@localhost


docker stop mygccarm

docker rm mygccarm
docker rmi image-gccarm:v0.01

# download and install linux binary from
# https://launchpad.net/gcc-arm-embedded/+download
# wget & tar xvf on workspace somwehere
cd /home/wahoo/workspace/launchpad.gnu-arm/gcc-arm-none-eabi-4_9-2015q2/bin

# Status
This docker has been tested on Ubuntu 14.04LTS, 64bit environment.

# Licenese
MIT. See LICENSE file.
