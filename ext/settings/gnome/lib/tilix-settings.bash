#!/usr/bin/env bash

__help() {
  echo "Usage: "
  echo "       get"
  echo "       set <color file>"
}

func=
case $1 in
  get)
    func="__get-settings"
    ;;
  set)
    [ -z "$2" ] && __help && exit 1
    source $2
    func="__set-settings"
    ;;
  *)
    __help
    exit 1
    ;;
esac


#########################################################

declare -A globalsettings
globalsettings=( \
  ["com.gexperts.Tilix.Settings use-overlay-scrollbar"]="false" \
  ["com.gexperts.Tilix.Settings use-tabs"]="true" \
  ["com.gexperts.Tilix.Settings unsafe-paste-alert"]="false" \
  ["com.gexperts.Tilix.Settings terminal-title-style"]="small" \
  ["com.gexperts.Tilix.Keybindings terminal-reset-and-clear"]="<Super>k" \
  ["com.gexperts.Tilix.Keybindings terminal-copy"]="<Super>c" \
  ["com.gexperts.Tilix.Keybindings terminal-paste"]="<Super>v" \
  ["com.gexperts.Tilix.Keybindings app-new-session"]="<Super>t" \
  ["com.gexperts.Tilix.Keybindings session-close"]="<Super>w" \
  ["com.gexperts.Tilix.Keybindings session-add-down"]="<Ctrl><Alt>d" \
  ["com.gexperts.Tilix.Keybindings session-add-right"]="<Ctrl><Alt>r" \
  ["com.gexperts.Tilix.Keybindings session-switch-to-terminal-down"]="<Alt>Down" \
  ["com.gexperts.Tilix.Keybindings session-switch-to-terminal-left"]="<Alt>Left" \
  ["com.gexperts.Tilix.Keybindings session-switch-to-terminal-right"]="<Alt>Right" \
  ["com.gexperts.Tilix.Keybindings session-switch-to-terminal-up"]="<Alt>Up" \
)

declare -A profilesettings
profilesettings=( \
  ["allow-bold"]="false" \
  ["text-blink-mode"]="never" \
  ["default-size-columns"]="120" \
  ["default-size-rows"]="35" \
  ["scrollback-unlimited"]="true" \
  ["use-system-font"]="false" \
  ["font"]="Iosevka Term 15" \
  ["cursor-shape"]="underline" \
  ["terminal-bell"]="none" \
  ["use-theme-colors"]="false" \
  ["foreground-color"]="$C_FG" \
  ["background-color"]="$C_BG" \
  ["highlight-colors-set"]="true" \
  ["highlight-foreground-color"]="$C_HFG" \
  ["highlight-background-color"]="$C_HBG" \
  ["cursor-colors-set"]="true" \
  ["cursor-foreground-color"]="$C_HFG" \
  ["cursor-background-color"]="$C_HBG" \
  ["palette"]="$C_PAL" \
)

__set-settings() {
  tdp=$(gsettings get com.gexperts.Tilix.ProfilesList default | tr -d \')
  default_profile_path="com.gexperts.Tilix.Profile:/com/gexperts/Tilix/profiles/${tdp}/"

  for key in "${!globalsettings[@]}"; do
    gsettings-set "${key}" "${globalsettings[$key]}"
  done

  for key in "${!profilesettings[@]}"; do
    gsettings-set "${default_profile_path} ${key}" "${profilesettings[$key]}"
  done
}

__gsettings-get() {
  printf "\e[2m%s\e[0m \e[94m=>\e[0m \e[1;32m%s\e[0m\n" "$1" "$(gsettings get $1)"
}

__get-settings() {
  tdp=$(gsettings get com.gexperts.Tilix.ProfilesList default | tr -d \')
  default_profile_path="com.gexperts.Tilix.Profile:/com/gexperts/Tilix/profiles/${tdp}/"

  for key in "${!globalsettings[@]}"; do
    __gsettings-get "${key}"
  done

  for key in "${!profilesettings[@]}"; do
    __gsettings-get "${default_profile_path} ${key}"
  done
}

${func}