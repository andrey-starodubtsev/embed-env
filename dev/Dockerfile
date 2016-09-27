FROM ubuntu

MAINTAINER Andrey Starodubtsev, https://github.com/andrey-starodubtsev

RUN apt-get update && \
    apt-get install -y \
      automake \
      build-essential \
      git \
      lib32z1 \
      libc6-i386 \
      tcl \
      wget && \
    PERL_MM_USE_DEFAULT=1 cpan -i \
      Crypt::RC4 \
      Data::Dump \
      XML::Simple \
      boolean

RUN cd $HOME && \
    wget ftp://ecos.sourceware.org/pub/ecos/ecos-install.tcl && \
    chmod +x ecos-install.tcl && \
    ./ecos-install.tcl -m ftp://ecos.sourceware.org/pub/ecos $HOME/ecos arm-eabi && \
    ./ecos-install.tcl -m ftp://ftp.funet.fi/pub/mirrors/sources.redhat.com/pub/ecos $HOME/ecos arm-elf && \
    echo '. $HOME/ecos/ecosenv.sh' >> $HOME/.bashrc

ENV EMBED_ENV dev
