FROM ubuntu

MAINTAINER Andrey Starodubtsev, https://github.com/andrey-starodubtsev

RUN apt-get update && \
    apt-get install -y apt-utils && \
    apt-get install -y \
      automake \
      build-essential \
      ca-cacert \
      git \
      lib32z1 \
      libc6-i386 \
      libcrypt-rc4-perl \
      libdata-dump-perl \
      libhttp-server-simple-perl \
      libboolean-perl \
      libssl-dev \
      libxml-simple-perl \
      sip-tester \
      tcl \
      valgrind \
      wget && \
      update-ca-certificates

RUN cd $HOME && \
    wget ftp://ecos.sourceware.org/pub/ecos/ecos-install.tcl && \
    chmod +x ecos-install.tcl && \
    ./ecos-install.tcl -m ftp://ecos.sourceware.org/pub/ecos $HOME/ecos 'arm-elf (old)' arm-eabi && \
    echo '. $HOME/ecos/ecosenv.sh' >> $HOME/.bashrc

ENV EMBED_ENV dev
