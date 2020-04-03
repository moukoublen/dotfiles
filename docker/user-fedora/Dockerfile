FROM fedora:31

RUN dnf update --refresh --assumeyes || true

RUN dnf install -y \
    bash \
    bash-completion

COPY scripts/ps1.sh /etc/profile.d/ps1.sh
RUN mkdir -p /opt/dsc/

### User ###
ARG USER=yoda
ARG USER_ID=1000
ARG GROUP=yoda
ARG GROUP_ID=1000
ARG USER_HOME_DIR=/home/yoda

COPY scripts/create-user /opt/dsc/create-user
RUN /opt/dsc/create-user $USER $USER_ID $GROUP $GROUP_ID $USER_HOME_DIR

COPY scripts/bashrc /opt/dsc/bashrc
RUN cat /opt/dsc/bashrc >> $USER_HOME_DIR/.bashrc

USER yoda
