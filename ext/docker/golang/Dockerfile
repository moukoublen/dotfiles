FROM user-fedora

USER root

ARG GO_VERSION=1.14.4

RUN set -x && \
    dnf install -y git make gcc gcc-c++ strace gdb && \
    curl -L --silent --fail \
        https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz > /tmp/go${GO_VERSION}.linux-amd64.tar.gz && \
    if [ -d /usr/local/go ]; then sudo rm -rf /usr/local/go; fi && \
    tar -C /usr/local -xzf /tmp/go${GO_VERSION}.linux-amd64.tar.gz && \
    rm /tmp/go${GO_VERSION}.linux-amd64.tar.gz

USER ${NEW_USER}

RUN echo 'export PATH=/usr/local/go/bin:$PATH' >> ~/.bashrc
RUN echo 'export PATH=$HOME/go/bin:$PATH' >> ~/.bashrc
RUN echo 'export GOPATH=$HOME/go' >> ~/.bashrc
RUN source ~/.bashrc && go get -u golang.org/x/lint/golint
