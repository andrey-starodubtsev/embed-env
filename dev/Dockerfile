FROM ubuntu

MAINTAINER Andrey Starodubtsev, https://github.com/andrey-starodubtsev

RUN apt-get update && \
    apt-get install -y \
      automake \
      build-essential \
      git \
      libc6-i386 \
      tcl \
      wget && \
    PERL_MM_USE_DEFAULT=1 cpan -i \
      Data::Dump \
      boolean

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

ENV EMBED_ENV dev
