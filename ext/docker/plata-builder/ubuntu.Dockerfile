FROM user-ubuntu:latest

USER root

ENV DEBIAN_FRONTEND=noninteractive \
    DEBCONF_NONINTERACTIVE_SEEN=true \
    LC_ALL=C.UTF-8 \
    LANG=C.UTF-8

RUN apt-get install -y \
    make \
    autoconf \
    automake \
    inkscape \
    libgdk-pixbuf2.0-dev \
    libglib2.0-dev \
    libxml2-utils \
    pkg-config \
    sassc \
    parallel

USER ${NEW_USER}
