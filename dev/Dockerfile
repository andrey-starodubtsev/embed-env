FROM ubuntu

MAINTAINER Andrey Starodubtsev, https://github.com/andrey-starodubtsev

# ARG USER=me

ENV TZ Europe/Moscow

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    sed -ie "s#^deb http#deb [arch=amd64,i386] http#" /etc/apt/sources.list && \
    dpkg --add-architecture i386 && \
    apt-get update -y && \
    apt-get install -y apt-utils && \
    apt-get install -y \
      automake \
      build-essential \
      ca-cacert \
      cmake \
      lib32z1 \
      libc6-i386 \
      libcurl4-openssl-dev \
      libssl-dev \
      libtool \
      p7zip-full \
      tcl \
      wget && \
      update-ca-certificates

RUN apt-get install -y \
      gcovr \
      git \
      sip-tester \
      valgrind

# FIXE: don't work at the moment
# # https://www.ivankrizsan.se/2015/08/08/creating-a-docker-image-with-ubuntu-and-java/
# RUN apt-get install -y  software-properties-common && \
#     add-apt-repository ppa:webupd8team/java -y && \
#     apt-get update && \
#     echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
#     apt-get install -y oracle-java7-installer && \
#     apt-get clean

RUN apt-get install -y default-jre

RUN apt-get install -y libncurses5:i386

RUN apt-get install -y \
      libaudio-wav-perl \
      libauthen-simple-passwd-perl \
      libauthen-simple-perl \
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
      libparse-netstat-perl \
      libparse-syslog-perl \
      libpcap-dev \
      libpath-class-perl \
      libproc-background-perl \
      libproc-processtable-perl \
      libxml-simple-perl \
      perl-tk

RUN apt-get install -y \
      net-tools \
      tcpdump

RUN git clone https://github.com/andrey-starodubtsev/HTTP-Server-Simple-Authen && \
    cd HTTP-Server-Simple-Authen && \
    perl Makefile.PL && \
    make && \
    make test && \
    make install

RUN apt-get install -y clang llvm vim ninja-build

    # ln -s /usr/lib/llvm-*/bin/llvm-symbolizer /usr/bin/

# prereqs for perl-required-modules.pl
RUN apt-get install -y \
      apt-file \
      libperl-prereqscanner-perl \
      libmodule-path-perl \
      libfile-next-perl && \
      apt-file update

RUN apt-get -y install \
      libarchive-extract-perl \
      libarchive-zip-perl \
      libcapture-tiny-perl \
      libdatetime-perl \
      libdbd-mysql-perl \
      libdbi-perl \
      libdevice-modem-perl \
      libenum-perl \
      libfile-slurp-perl \
      libio-async-perl \
      liblog-any-perl \
      liblog-dispatch-perl \
      libmail-sender-perl \
      libmodule-install-perl \
      libmodule-build-perl \
      libnet-dns-perl \
      libnet-route-perl \
      libnet-sftp-foreign-perl \
      libnet-ssh2-perl \
      libnet-telnet-perl \
      libproc-background-perl \
      libreadonly-perl \
      liburi-perl \
      libxml-stream-perl

RUN apt-get -y install \
      imagemagick \
      cpanminus \
    && \
    cpanm Test::More

# RUN yes | cpan -i Net::RTP::Packet

# RUN adduser --force-badname --home "/home/$USER" --uid 1000 "$USER" --disabled-password

# USER $USER
# ENV HOME /home/$USER
# WORKDIR $HOME
ENV EMBED_ENV dev

RUN cd $HOME && \
    wget ftp://ecos.sourceware.org/pub/ecos/ecos-install.tcl && \
    chmod +x ecos-install.tcl && \
    ./ecos-install.tcl -m ftp://ecos.sourceware.org/pub/ecos $HOME/ecos 'arm-elf (old)' arm-eabi && \
    echo '. $HOME/ecos/ecosenv.sh' >> $HOME/.bashrc

RUN git config --global --add safe.directory '*'
