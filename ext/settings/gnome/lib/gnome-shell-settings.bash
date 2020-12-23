#!/usr/bin/env bash

__help() {
  echo "Usage: <set|get>"
}

func=
case $1 in
  get)
    func="__get-settings"
    ;;
  set)
    func="__set-settings"
    ;;
  *)
    __help
    exit 1
    ;;
esac

declare -A settings
settings=( \
  ["org.gnome.shell.keybindings focus-active-notification"]="[]" \
  ["org.gnome.shell.keybindings toggle-message-tray"]="[]" \
  ["org.gnome.mutter.keybindings toggle-tiled-left"]="['<Super>Left']" \
  ["org.gnome.mutter.keybindings toggle-tiled-right"]="['<Super>Right']" \
  ["org.gnome.desktop.wm.keybindings maximize"]="['<Super>Up']" \
  ["org.gnome.desktop.wm.keybindings unmaximize"]="['<Super>Down']" \
  ["org.gnome.desktop.wm.keybindings maximize-vertically"]="['<Shift><Alt>r']" \
  ["org.gnome.desktop.wm.keybindings maximize-horizontally"]="['<Shift><Alt>e']" \
  ["org.gnome.desktop.wm.keybindings switch-applications"]="['<Super>Tab']" \
  ["org.gnome.desktop.wm.keybindings switch-windows"]="['<Alt>Tab']" \
  ["org.gnome.desktop.wm.preferences action-middle-click-titlebar"]="toggle-maximize-vertically" \
  ["org.gnome.desktop.wm.preferences button-layout"]="appmenu:minimize,maximize,close" \
  ["org.gnome.desktop.interface font-name"]="Iosevka Aile 11" \
  ["org.gnome.desktop.interface document-font-name"]="Iosevka Aile 11" \
  ["org.gnome.desktop.interface monospace-font-name"]="Iosevka 12" \
  ["org.gnome.desktop.wm.preferences titlebar-font"]="Iosevka Etoile 11" \
  ["org.gnome.desktop.interface cursor-size"]="32" \
)

__set-settings() {
  for key in "${!settings[@]}"; do
    gsettings-set "${key}" "${settings[$key]}"
  done
}

__gsettings-get() {
  printf "\e[2m%s\e[0m \e[94m=>\e[0m \e[1;32m%s\e[0m\n" "$1" "$(gsettings get $1)"
}

__get-settings() {
  for key in "${!settings[@]}"; do
    __gsettings-get "${key}"
  done
}

${func}