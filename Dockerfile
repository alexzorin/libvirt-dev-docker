FROM alexzorin/gitgo
MAINTAINER Alex Zorin <alex@zor.io>

RUN echo 'deb http://http.debian.net/debian wheezy-backports main' >> /etc/apt/sources.list.d/backports.list
RUN sed -i -e 's/ftp.fr.debian.org/http.debian.net/g' /etc/apt/sources.list
ADD ./apt-preferences /etc/apt/preferences
RUN apt-get update

RUN DEBCONF_FRONTEND=noninteractive DEBIAN_FRONTEND=noninteractive apt-get -t wheezy-backports -y --no-install-recommends install libvirt-dev gcc g++ build-essential
RUN mkdir -p /usr/share/libvirt && echo 'placeholder' > /usr/share/libvirt/libvirtLogo.png
