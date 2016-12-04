FROM ubuntu

MAINTAINER Andrey Starodubtsev, https://github.com/andrey-starodubtsev

RUN apt-get update && \
    apt-get install -y apt-utils && \
    apt-get install -y \
      automake \
      build-essential \
      cpanminus \
      git \
      lib32z1 \
      libc6-i386 \
      libssl-dev \
      tcl \
      wget && \
    cpanm \
      Crypt::RC4 \
      Data::Dump \
      XML::Simple \
      boolean \
      HTTP::Server::Simple

# despite http://ecos.sourceware.org/getstart.html says
# arm-elf toolchain is not available:
#
# $ ./ecos-install.tcl $HOME/ecos arm-elf
# [**************************************************]
# Retrieving GNU tools for arm-elf
#
# *** ecos-install.tcl error: Tools for "arm-elf" not found

RUN cd $HOME && \
    wget ftp://ecos.sourceware.org/pub/ecos/ecos-install.tcl && \
    chmod +x ecos-install.tcl && \
    ./ecos-install.tcl -m ftp://ecos.sourceware.org/pub/ecos $HOME/ecos arm-eabi && \
    echo '. $HOME/ecos/ecosenv.sh' >> $HOME/.bashrc

RUN echo "127.0.0.1 testbed" >> /etc/hosts

ENV EMBED_ENV dev
