FROM user-ubuntu

USER root

ARG GO_VERSION=1.14.4

RUN set -x && \
    sudo apt-get update && sudo apt-get upgrade -y && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt install -y git make gcc g++ strace gdb build-essential && \
    ln -fs /usr/share/zoneinfo/Europe/Athens /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    curl -L --silent --fail \
        https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz > /tmp/go${GO_VERSION}.linux-amd64.tar.gz && \
    if [ -d /usr/local/go ]; then sudo rm -rf /usr/local/go; fi && \
    tar -C /usr/local -xzf /tmp/go${GO_VERSION}.linux-amd64.tar.gz && \
    rm /tmp/go${GO_VERSION}.linux-amd64.tar.gz

USER ${NEW_USER}

RUN set -x && \
    echo 'export PATH=/usr/local/go/bin:$PATH' >> ~/.bashrc && \
    echo 'export PATH=$HOME/go/bin:$PATH' >> ~/.bashrc && \
    echo 'export GOPATH=$HOME/go' >> ~/.bashrc && \
    . ~/.bashrc && \
    GOPATH=$HOME/go /usr/local/go/bin/go get -u golang.org/x/lint/golint
