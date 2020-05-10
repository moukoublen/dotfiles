#!/usr/bin/env bash

__gs_get() {
  printf "\e[2m%s\e[0m \e[94m=>\e[0m \e[1;32m%s\e[0m\n" "$1" "$(gsettings get $1)"
}

__gnome_terminal_profile_name_and_uuid_by_name() {
  local req_name="$1"
  if [[ -z "${req_name}" ]]; then
    return 1
  fi

  local profiles_array=($(gsettings get org.gnome.Terminal.ProfilesList list | tr -d "[]\',"))
  for prf in "${profiles_array[@]}"; do
    local name=$(gsettings get "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${prf}/" visible-name)
    if [[ $name == "'${req_name}'" ]]; then
      echo "$req_name $prf"
      return 0
    fi
  done

  return 1
}

__gnome_terminal_default_profile_name_and_uuid() {
  local uuid="$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')"
  echo "Default $uuid"
}

__main() {
  local GP_NAME=
  local GP_UUID=
  if [[ -z "${1-}" ]]; then
    read GP_NAME GP_UUID < <(__gnome_terminal_default_profile_name_and_uuid)
  else
    local GT_OUTPUT=""
    if GT_OUTPUT=$(__gnome_terminal_profile_name_and_uuid_by_name "$1"); then
      read GP_NAME GP_UUID < <(echo "$GT_OUTPUT");
    else
      echo "No valid profile name $1"
      return 1
    fi
  fi

  local GS_PRF_PATH="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${GP_UUID}/"

  echo -e "\e[1;36m=============\e[0m \e[1;34mGlobal Settings\e[0m \e[1;36m=============\e[0m"
  __gs_get "org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ copy"
  __gs_get "org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ paste"
  __gs_get "org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ new-tab"
  __gs_get "org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ close-tab"
  __gs_get "org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ reset-and-clear"
  echo
  echo

  echo -e "\e[1;36m=============\e[0m \e[1;34mProfile $GP_NAME $GP_UUID\e[0m \e[1;36m=============\e[0m"
  __gs_get "${GS_PRF_PATH} text-blink-mode"
  __gs_get "${GS_PRF_PATH} default-size-columns"
  __gs_get "${GS_PRF_PATH} default-size-rows"
  __gs_get "${GS_PRF_PATH} scrollback-unlimited"
  __gs_get "${GS_PRF_PATH} use-system-font"
  __gs_get "${GS_PRF_PATH} font"
  __gs_get "${GS_PRF_PATH} cursor-shape"
  __gs_get "${GS_PRF_PATH} audible-bell"
  __gs_get "${GS_PRF_PATH} use-theme-colors"
  __gs_get "${GS_PRF_PATH} highlight-colors-set"
  __gs_get "${GS_PRF_PATH} foreground-color"
  __gs_get "${GS_PRF_PATH} background-color"
  __gs_get "${GS_PRF_PATH} highlight-foreground-color"
  __gs_get "${GS_PRF_PATH} highlight-background-color"
  __gs_get "${GS_PRF_PATH} palette"

  echo
  echo
}

__main "$*"

unset -f __main
unset -f __gnome_terminal_default_profile_uuid
unset -f __gnome_terminal_profile_uuid_by_name
unset -f __gs_get
