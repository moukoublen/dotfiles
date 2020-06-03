FROM user-fedora

USER root

ARG GO_VERSION=1.14.4

RUN set -x && \
    sudo dnf install -y @development-tools && \
    dnf install -y make && \
    curl -L --silent --fail \
        https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz > /tmp/go${GO_VERSION}.linux-amd64.tar.gz && \
    if [ -d /usr/local/go ]; then sudo rm -rf /usr/local/go; fi && \
    tar -C /usr/local -xzf /tmp/go${GO_VERSION}.linux-amd64.tar.gz && \
    rm /tmp/go${GO_VERSION}.linux-amd64.tar.gz

USER ${NEW_USER}
