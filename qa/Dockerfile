FROM php:7-apache

MAINTAINER Andrey Starodubtsev, https://github.com/andrey-starodubtsev

RUN apt-get update && \
    apt-get install -y \
      libdbd-mysql-perl \
      libnet-ssh2-perl \
      libxml-sax-expat-perl \
      perl

RUN cpan -i \
      boolean \
      Crypt::RC4 \
      DBI \
      File::Which \
      JSON \
      MIME::Lite \
      XML::Simple

# fail
# RUN cpan -i \
#       Term::ReadKey \
#       Tk

ENV TJ_ENV qa
