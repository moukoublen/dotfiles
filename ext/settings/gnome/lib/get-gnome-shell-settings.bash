#!/usr/bin/env bash

__gs_get() {
  printf "\e[2m%s\e[0m \e[94m=>\e[0m \e[1;32m%s\e[0m\n" "$1" "$(gsettings get $1)"
}

################### Gnome Shell and WM #########################################
echo ""
echo "----- Gnome Settings --------"
__gs_get "org.gnome.desktop.interface font-name"
__gs_get "org.gnome.desktop.interface document-font-name"
__gs_get "org.gnome.desktop.interface monospace-font-name"
__gs_get "org.gnome.desktop.wm.preferences titlebar-font"
__gs_get "org.gnome.desktop.interface cursor-size"
echo "-----------------------------------"
################################################################################
