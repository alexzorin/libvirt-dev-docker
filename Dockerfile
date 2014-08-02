FROM alexzorin/gitgo
MAINTAINER Alex Zorin <alex@zor.io>

RUN sed -i -e 's/ftp.fr.debian.org/http.debian.net/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install libvirt-dev=0.9.* gcc g++ build-essential
RUN mkdir -p /usr/share/libvirt && echo 'placeholder' > /usr/share/libvirt/libvirtLogo.png

