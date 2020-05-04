#!/usr/bin/env bash

################### Gnome Terminal #############################################
echo ""
echo "----- Gnome Terminal Settings -----"
gdp=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')
default_profile_path="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${gdp}/"

gsettings-set "org.gnome.Terminal.Legacy.Settings default-show-menubar" "false"

gsettings-set "org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ copy" "<Super>c"
gsettings-set "org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ paste" "<Super>v"
gsettings-set "org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ new-tab" "<Super>t"
gsettings-set "org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ close-tab" "<Super>w"
gsettings-set "org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ reset-and-clear" "<Super>k"

gsettings-set "${default_profile_path} allow-bold" "false"
gsettings-set "${default_profile_path} text-blink-mode" "never"
gsettings-set "${default_profile_path} default-size-columns" "120"
gsettings-set "${default_profile_path} default-size-rows" "30"
gsettings-set "${default_profile_path} scrollback-unlimited" "true"
gsettings-set "${default_profile_path} use-system-font" "false"
gsettings-set "${default_profile_path} font" 'Hack 15'
gsettings-set "${default_profile_path} cursor-shape" "ibeam"
gsettings-set "${default_profile_path} audible-bell" "false"
gsettings-set "${default_profile_path} use-theme-colors" "false"
gsettings-set "${default_profile_path} highlight-colors-set" "true"
gsettings-set "${default_profile_path} foreground-color" "$C_FG"
gsettings-set "${default_profile_path} background-color" "$C_BG"
gsettings-set "${default_profile_path} highlight-foreground-color" "$C_HFG"
gsettings-set "${default_profile_path} highlight-background-color" "$C_HBG"
gsettings-set "${default_profile_path} palette" "$C_PAL"
echo "-----------------------------------"
################################################################################
