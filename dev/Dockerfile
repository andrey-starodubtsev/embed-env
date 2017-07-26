FROM ubuntu

MAINTAINER Andrey Starodubtsev, https://github.com/andrey-starodubtsev

RUN apt-get update && \
    apt-get install -y apt-utils && \
    apt-get install -y \
      automake \
      build-essential \
      ca-cacert \
      lib32z1 \
      libc6-i386 \
      libssl-dev \
      tcl \
      wget && \
      update-ca-certificates

RUN cd $HOME && \
    wget ftp://ecos.sourceware.org/pub/ecos/ecos-install.tcl && \
    chmod +x ecos-install.tcl && \
    ./ecos-install.tcl -m ftp://ecos.sourceware.org/pub/ecos $HOME/ecos 'arm-elf (old)' arm-eabi && \
    echo '. $HOME/ecos/ecosenv.sh' >> $HOME/.bashrc

RUN apt-get update && \
    apt-get install -y \
      gcovr \
      git \
      sip-tester \
      valgrind

# FIXE: don't work at the moment
# # https://www.ivankrizsan.se/2015/08/08/creating-a-docker-image-with-ubuntu-and-java/
# RUN apt-get update && \
#     apt-get install -y  software-properties-common && \
#     add-apt-repository ppa:webupd8team/java -y && \
#     apt-get update && \
#     echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
#     apt-get install -y oracle-java7-installer && \
#     apt-get clean

RUN apt-get update && \
    apt-get install -y default-jre

RUN apt-get install -y lib32ncurses5

RUN apt-get update && \
    apt-get install -y \
      libaudio-wav-perl \
      libboolean-perl \
      libclone-perl \
      libcrypt-rc4-perl \
      libdata-dump-perl \
      libdate-calc-perl \
      libfile-copy-recursive-perl \
      libfile-which-perl \
      libhttp-daemon-ssl-perl \
      libhttp-server-simple-perl \
      libipc-system-simple-perl \
      libjson-perl \
      libnet-address-ip-local-perl \
      libnet-dns-perl \
      libparse-syslog-perl \
      libpath-class-perl \
      libproc-background-perl \
      libproc-processtable-perl \
      libxml-simple-perl \
      perl-tk

RUN apt-get update && \
    apt-get install -y \
      net-tools \
      tcpdump

ENV EMBED_ENV dev
