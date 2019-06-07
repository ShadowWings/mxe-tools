FROM ubuntu:bionic

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt-get update && \
    apt-get install -y autoconf \
                       automake \
                       autopoint \
                       bash \
                       bison \
                       bzip2 \
                       flex \
                       g++ \
                       g++-multilib \
                       gettext \
                       git \
                       gperf \
                       intltool \
                       libc6-dev-i386 \
                       libgdk-pixbuf2.0-dev \
                       libltdl-dev \
                       libssl-dev \
                       libtool-bin \
                       libxml-parser-perl \
                       lzip \
                       make \
                       openssl \
                       p7zip-full \
                       patch \
                       perl \
                       pkg-config \
                       python \
                       ruby \
                       sed \
                       unzip \
                       wget \
                       xz-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV MXE_TARGETS=x86_64-w64-mingw32.static.posix
ENV MXE_USE_CCACHE=
    
WORKDIR /
RUN git clone https://github.com/mxe/mxe

WORKDIR /mxe
RUN make JOBS=2 -j2 gcc qtbase

