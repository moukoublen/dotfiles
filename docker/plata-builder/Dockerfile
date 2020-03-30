FROM ubuntu:18.04

RUN groupadd --gid 1000 builder \
  && useradd --uid 1000 --gid builder --shell /bin/bash --create-home builder

RUN apt-get update \
  && apt-get install -y \
    build-essential \
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

USER builder
