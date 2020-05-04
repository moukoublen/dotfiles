FROM user-fedora:latest

USER root

RUN dnf install -y \
    bash \
    bash-completion \
    findutils \
    git \
    make \
    cmake \
    automake \
    gcc \
    gcc-c++ \
    sqlite \
    sqlite-devel \
    openssl \
    openssl-devel \
    bzip2 \
    bzip2-devel \
    zlib \
    zlib-devel \
    readline \
    readline-devel \
    community-mysql-devel

# gflags gflags-devel glog glog-devel gtest gtest-devel swig

USER ${NEW_USER}

RUN echo $' \n\
export PYENV_ROOT="$HOME/.pyenv" \n\
export PATH="$PYENV_ROOT/bin:$PATH" \n\
eval "$(pyenv init -)" \n\
' >> "${HOME}/.bashrc";

RUN git clone https://github.com/yyuu/pyenv.git ~/.pyenv
