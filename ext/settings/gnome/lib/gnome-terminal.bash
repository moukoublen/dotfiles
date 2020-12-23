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
  ["org.gnome.Terminal.Legacy.Settings default-show-menubar"]="false" \
  ["org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ copy"]="<Super>c" \
  ["org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ paste"]="<Super>v" \
  ["org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ new-tab"]="<Super>t" \
  ["org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ close-tab"]="<Super>w" \
  ["org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ reset-and-clear"]="<Super>k" \
)

declare -A profilesettings
profilesettings=( \
  ["scrollbar-policy"]="always" \
  ["scrollback-unlimited"]="true" \
  ["rewrap-on-resize"]="true" \
  ["text-blink-mode"]="never" \
  ["default-size-columns"]="120" \
  ["default-size-rows"]="30" \
  ["use-system-font"]="false" \
  ["font"]="Iosevka Term Expanded 16" \
  ["cursor-shape"]="underline" \
  ["audible-bell"]="false" \
  ["use-theme-colors"]="false" \
  ["highlight-colors-set"]="true" \
  ["highlight-foreground-color"]="$C_HFG" \
  ["highlight-background-color"]="$C_HBG" \
  ["cursor-colors-set"]="true" \
  ["cursor-background-color"]="$C_HBG" \
  ["cursor-foreground-color"]="$C_HFG" \
  ["foreground-color"]="$C_FG" \
  ["background-color"]="$C_BG" \
  ["palette"]="$C_PAL" \
)

__set-settings() {
  gdp=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')
  default_profile_path="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${gdp}/"

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
  gdp=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')
  default_profile_path="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${gdp}/"

  for key in "${!globalsettings[@]}"; do
    __gsettings-get "${key}"
  done

  for key in "${!profilesettings[@]}"; do
    __gsettings-get "${default_profile_path} ${key}"
  done
}

${func}