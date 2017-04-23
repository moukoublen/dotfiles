#!/usr/bin/env bash

function print-version-if-exists {
  if which $1 > /dev/null 2>&1; then $1 ${2:---version}; fi
}

if which nautilus 2>&1; then nautilus --version |& grep GNOME; fi

for prb in \
gnome-shell \
gnome-terminal \
gedit \
gnome-builder \
gnome-calculator \
gnome-calendar \
gnome-control-center \
gnome-software
do
  print-version-if-exists $prb
done
