#!/usr/bin/env bash

################### Gnome Shell and WM #########################################
echo ""
echo "----- Gnome Settings --------"
gsettings-set "org.gnome.shell.keybindings focus-active-notification" "[]"
gsettings-set "org.gnome.shell.keybindings toggle-message-tray" "[]"

gsettings-set "org.gnome.mutter.keybindings toggle-tiled-left" "['<Super>Left']"
gsettings-set "org.gnome.mutter.keybindings toggle-tiled-right" "['<Super>Right']"
gsettings-set "org.gnome.desktop.wm.keybindings maximize" "['<Super>Up']"
gsettings-set "org.gnome.desktop.wm.keybindings unmaximize" "['<Super>Down']"
gsettings-set "org.gnome.desktop.wm.keybindings maximize-vertically" "['<Shift><Alt>r']"
gsettings-set "org.gnome.desktop.wm.keybindings maximize-horizontally" "['<Shift><Alt>e']"
gsettings-set "org.gnome.desktop.wm.keybindings switch-applications" "['<Super>Tab']"
gsettings-set "org.gnome.desktop.wm.keybindings switch-windows" "['<Alt>Tab']"
gsettings-set "org.gnome.desktop.wm.preferences action-middle-click-titlebar"  'toggle-maximize-vertically'
gsettings-set "org.gnome.desktop.wm.preferences button-layout" "appmenu:minimize,maximize,close"

gsettings-set "org.gnome.desktop.interface font-name" "Iosevka Aile 11"
gsettings-set "org.gnome.desktop.interface document-font-name" "Iosevka Aile 11"
gsettings-set "org.gnome.desktop.interface monospace-font-name" "Iosevka 12"
gsettings-set "org.gnome.desktop.wm.preferences titlebar-font" "Iosevka Etoile 11"

gsettings-set "org.gnome.desktop.interface cursor-size" "32"
echo "-----------------------------------"
################################################################################
