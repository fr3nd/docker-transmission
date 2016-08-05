# run with:
# docker run --rm -p 127.0.0.1:9091:9091 -p 127.0.0.1:51413:51413 -p 127.0.0.1:51413:51413/udp 0421b83c5a35
# build with:
# docker build -t fr3nd/transmission:latest .

FROM ubuntu:14.04
MAINTAINER Carles Amigó, fr3nd@fr3nd.net

ENV TRANSMISSION_VERSION 2.84

RUN apt-get update
RUN apt-get install -y build-essential automake autoconf libtool pkg-config intltool libglib2.0-dev libevent-dev libminiupnpc-dev libminiupnpc-dev libcurl4-openssl-dev
RUN apt-get install -y wget
RUN wget https://transmission.cachefly.net/transmission-${TRANSMISSION_VERSION}.tar.xz
RUN tar xvJf transmission-${TRANSMISSION_VERSION}.tar.xz
WORKDIR transmission-2.84
RUN ./configure --disable-gtk --enable-daemon --disable-cli --prefix=/usr
RUN make
RUN make install
WORKDIR /
RUN rm -rf transmission-*

EXPOSE 9091 51413 51413/udp
