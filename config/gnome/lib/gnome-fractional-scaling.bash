#!/usr/bin/env bash

__help() {
  echo "Usage: ${0} <set|get>"
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
  ["org.gnome.mutter experimental-features"]="['scale-monitor-framebuffer']" \
)

# Enable
# gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
### org.gnome.mutter experimental-features => ['scale-monitor-framebuffer']

# Disable
# gsettings set org.gnome.mutter experimental-features "[]"
### org.gnome.mutter experimental-features => @as []

__set-settings() {
  for key in "${!settings[@]}"; do
    gsettings-set "${key}" "${settings[$key]}"
  done
}

__get-settings() {
  for key in "${!settings[@]}"; do
    gsettings-get "${key}"
  done
}

${func}
