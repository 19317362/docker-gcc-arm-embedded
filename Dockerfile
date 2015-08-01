FROM ubuntu:14.04

RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y upgrade

# install 32 bit libraries required for gnuarm tools from 
# https://launchpad.net/gcc-arm-embedded & a few minimalistic tools with ssh server
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get -y install \
    libc6:i386 libncurses5:i386 libstdc++6:i386 libpython2.7:i386 \
    make git \
    sudo curl less vim-tiny tree openssh-server

# clean cache
RUN apt-get clean

RUN mkdir -p /var/run/sshd
RUN useradd -G sudo --create-home --shell /bin/bash --user-group wahoo
RUN echo "wahoo:wahoo" | chpasswd

CMD ["/usr/sbin/sshd", "-D"]
EXPOSE 22

ENV WAHOO_WORKSPACE /home/wahoo/workspace
VOLUME ${WAHOO_WORKSPACE}
