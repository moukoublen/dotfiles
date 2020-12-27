FROM user-ubuntu

USER root

ARG DOCKER_VERSION="20.10.1"

RUN set -x && \
    mkdir -p /tmp/dockerin/ && \
    curl --fail --silent --show-error --location https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz --output /tmp/dockerin/docker.tgz && \
    tar xzvf /tmp/dockerin/docker.tgz -C /tmp/dockerin  && \
    cp /tmp/dockerin/docker/* /usr/local/bin  && \
    rm -rf /tmp/dockerin

USER ${NEW_USER}
