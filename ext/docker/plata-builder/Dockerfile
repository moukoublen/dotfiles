FROM user-fedora:latest

USER root

RUN dnf install -y \
    gtk2-engines \
    gtk-murrine-engine \
    gdk-pixbuf2 \
    make \
    autoconf \
    automake \
    gdk-pixbuf2-devel \
    glib2-devel \
    libxml2 \
    pkgconfig \
    sassc \
    parallel \
    inkscape-0.92.4-8.fc31

USER ${NEW_USER}
