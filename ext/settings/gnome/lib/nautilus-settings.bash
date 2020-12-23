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
  ["org.gnome.nautilus.list-view default-zoom-level"]="small" \
  ["org.gnome.nautilus.list-view use-tree-view"]="true" \
  ["org.gnome.nautilus.preferences default-folder-viewer"]="list-view" \
  ["org.gnome.nautilus.preferences show-delete-permanently"]="true" \
  ["org.gnome.nautilus.preferences show-hidden-files"]="true" \
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