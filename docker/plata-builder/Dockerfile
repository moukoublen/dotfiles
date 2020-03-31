FROM fedora:31

RUN groupadd --gid 1000 builder \
  && useradd --uid 1000 --gid builder --shell /usr/bin/bash --create-home builder

RUN dnf check-update --refresh --quiet || true
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

USER builder
