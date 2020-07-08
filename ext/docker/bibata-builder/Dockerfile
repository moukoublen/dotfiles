FROM user-fedora:latest

USER root

RUN dnf install -y git python37 python3-pip inkscape xcursorgen

USER ${NEW_USER}

RUN pip install --user Pillow==7.1.1
