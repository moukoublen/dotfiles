FROM ubuntu:18.04

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y \
    curl \
    wget \
    git \
    jq \
    bash \
    bash-completion \
    sudo \
    vim \
    nano

RUN mkdir -p /opt/dsc/

### User ###
ARG NEW_USER=yoda
ARG NEW_USER_ID=1000
ARG NEW_GROUP=yoda
ARG NEW_GROUP_ID=1000
ARG NEW_USER_HOME_DIR=/home/${NEW_USER}

COPY scripts/create-user /opt/dsc/create-user
RUN /opt/dsc/create-user $NEW_USER $NEW_USER_ID $NEW_GROUP $NEW_GROUP_ID $NEW_USER_HOME_DIR


COPY scripts/bashrc /opt/dsc/bashrc
RUN cat /opt/dsc/bashrc >> ${NEW_USER_HOME_DIR}/.bashrc

USER ${NEW_USER}
ENV NEW_USER=${NEW_USER}
