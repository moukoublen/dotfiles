#!/usr/bin/env bash

print_version_if_exists() {
  if which $1 > /dev/null 2>&1; then echo "$1 $($1 ${2:---version} | sed 's/[^0-9]*//')" ; fi
}

print_version_of_gnome_apps() {
  if which nautilus > /dev/null 2>&1; then echo "nautilus $(nautilus --version |& grep GNOME | sed 's/[^0-9]*//')"; fi

  for prb in \
    gnome-shell \
    gnome-terminal \
    gedit \
    gnome-builder \
    gnome-calendar \
    gnome-control-center \
    gnome-software \
    gnome-books \
    gnome-system-monitor
  do
    print_version_if_exists $prb | column -t
  done
}


print_version_of_gnome_apps | column -t
