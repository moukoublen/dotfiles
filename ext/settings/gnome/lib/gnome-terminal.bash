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

##__gnome_terminal_profile_name_and_uuid_by_name() {
##  local req_name="$1"
##  if [[ -z "${req_name}" ]]; then
##    return 1
##  fi
##
##  local profiles_array=($(gsettings get org.gnome.Terminal.ProfilesList list | tr -d "[]\',"))
##  for prf in "${profiles_array[@]}"; do
##    local name=$(gsettings get "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${prf}/" visible-name)
##    if [[ $name == "'${req_name}'" ]]; then
##      echo "$req_name $prf"
##      return 0
##    fi
##  done
##
##  return 1
##}
##
##__gnome_terminal_default_profile_name_and_uuid() {
##  local uuid="$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')"
##  echo "Default $uuid"
##}
##
##  local GP_NAME=
##  local GP_UUID=
##  if [[ -z "${1-}" ]]; then
##    read GP_NAME GP_UUID < <(__gnome_terminal_default_profile_name_and_uuid)
##  else
##    local GT_OUTPUT=""
##    if GT_OUTPUT=$(__gnome_terminal_profile_name_and_uuid_by_name "$1"); then
##      read GP_NAME GP_UUID < <(echo "$GT_OUTPUT");
##    else
##      echo "No valid profile name $1"
##      return 1
##    fi
##  fi
##
##  local GS_PRF_PATH="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${GP_UUID}/"
