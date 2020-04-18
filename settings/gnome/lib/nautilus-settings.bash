#!/usr/bin/env bash

################### Nautilus ###################################################
echo ""
echo "----- Nautilus Settings -----"
gsettings-set 'org.gnome.nautilus.list-view default-zoom-level' 'small'
gsettings-set 'org.gnome.nautilus.list-view use-tree-view' true
gsettings-set 'org.gnome.nautilus.preferences default-folder-viewer' 'list-view'
gsettings-set 'org.gnome.nautilus.preferences show-delete-permanently' true
gsettings-set 'org.gnome.nautilus.preferences show-hidden-files' true
echo "-----------------------------------"
################################################################################
