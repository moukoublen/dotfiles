#!/usr/bin/env bash

source $1

################### Tilix ######################################################
echo ""
echo "----- Tilix Settings --------------"
tdp=$(gsettings get com.gexperts.Tilix.ProfilesList default | tr -d \')
default_profile_path="com.gexperts.Tilix.Profile:/com/gexperts/Tilix/profiles/${tdp}/"

gsettings-set "com.gexperts.Tilix.Settings use-overlay-scrollbar" "false"
gsettings-set "com.gexperts.Tilix.Settings use-tabs" "true"
gsettings-set "com.gexperts.Tilix.Settings unsafe-paste-alert" "false"
gsettings-set "com.gexperts.Tilix.Settings terminal-title-style" "small"

gsettings-set "com.gexperts.Tilix.Keybindings terminal-reset-and-clear" "<Super>k"
gsettings-set "com.gexperts.Tilix.Keybindings terminal-copy" "<Super>c"
gsettings-set "com.gexperts.Tilix.Keybindings terminal-paste" "<Super>v"
gsettings-set "com.gexperts.Tilix.Keybindings app-new-session" "<Super>t"
gsettings-set "com.gexperts.Tilix.Keybindings session-close" "<Super>w"
gsettings-set "com.gexperts.Tilix.Keybindings session-add-down" "<Ctrl><Alt>d"
gsettings-set "com.gexperts.Tilix.Keybindings session-add-right" "<Ctrl><Alt>r"
gsettings-set "com.gexperts.Tilix.Keybindings session-switch-to-terminal-down" "<Alt>Down"
gsettings-set "com.gexperts.Tilix.Keybindings session-switch-to-terminal-left" "<Alt>Left"
gsettings-set "com.gexperts.Tilix.Keybindings session-switch-to-terminal-right" "<Alt>Right"
gsettings-set "com.gexperts.Tilix.Keybindings session-switch-to-terminal-up" "<Alt>Up"

gsettings-set "${default_profile_path} allow-bold" "false"
gsettings-set "${default_profile_path} text-blink-mode" "never"
gsettings-set "${default_profile_path} default-size-columns" "120"
gsettings-set "${default_profile_path} default-size-rows" "35"
gsettings-set "${default_profile_path} scrollback-unlimited" "true"
gsettings-set "${default_profile_path} use-system-font" "false"
gsettings-set "${default_profile_path} font" 'Iosevka 16'
gsettings-set "${default_profile_path} cursor-shape" "underline"
gsettings-set "${default_profile_path} terminal-bell" "none"
gsettings-set "${default_profile_path} use-theme-colors" "false"
gsettings-set "${default_profile_path} highlight-colors-set" "true"
gsettings-set "${default_profile_path} foreground-color" "$C_FG"
gsettings-set "${default_profile_path} background-color" "$C_BG"
gsettings-set "${default_profile_path} highlight-foreground-color" "$C_HFG"
gsettings-set "${default_profile_path} highlight-background-color" "$C_HBG"
gsettings-set "${default_profile_path} palette" "$C_PAL"

echo "-----------------------------------"
################################################################################
