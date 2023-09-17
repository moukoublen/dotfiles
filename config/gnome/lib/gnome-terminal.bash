#!/usr/bin/env bash

# it prints  "[name] [uuid]"
__gnome_terminal_profile_name_and_uuid() {
  local REQ_NAME="${1}"
  if [[ -z "${REQ_NAME}" ]]; then
    echo "Default $(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')"
    return
  fi

  local PROFILES_ARRAY=($(gsettings get org.gnome.Terminal.ProfilesList list | tr -d "[]\',"))
  for PRF in "${PROFILES_ARRAY[@]}"; do
    local name=$(gsettings get "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${PRF}/" visible-name)
    if [[ $name == "'${REQ_NAME}'" ]]; then
      echo "$REQ_NAME $PRF"
      return 0
    fi
  done

  return 1
}

# prints (name, uuid, profile_path)
__gnome_terminal_profile() {
  local GT_OUTPUT=()
  if ! GT_OUTPUT=($(__gnome_terminal_profile_name_and_uuid "${1}")); then
    return 1
  fi

  echo "${GT_OUTPUT[0]} ${GT_OUTPUT[1]} org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${GT_OUTPUT[1]}/"
}

__gnome_terminal_profile_list() {
  echo -e "\e[0;37mAvailable profiles:\e[0m"
  local PROFILES_ARRAY=($(gsettings get org.gnome.Terminal.ProfilesList list | tr -d "[]\',"))
  for PRF in "${PROFILES_ARRAY[@]}"; do
    local NAME=$(gsettings get "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${PRF}/" visible-name)
    echo -e "  \e[0;36m${NAME}\e[0m" | tr -d \'
  done
}

__help() {
  echo "Usage: "
  echo -e "       \e[0;35mget\e[0m \e[1;39m[\e[0;37mprofile name (optional)\e[1;39m]\e[0m"
  echo -e "       \e[0;35mset\e[0m \e[1;39m[\e[0;37mcolor file\e[1;39m]\e[0m \e[1;39m[\e[0;37mprofile name (optional)\e[1;39m]\e[0m"
  echo ""
  __gnome_terminal_profile_list
}

func=
case $1 in
  get)
    func="__get-settings"
    shift 1
    ;;
  set)
    [ -z "$2" ] && __help && exit 1
    source $2
    func="__set-settings"
    shift 2
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
  ["org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ copy"]="<Control><Shift>c" \
  ["org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ paste"]="<Control><Shift>v" \
  ["org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ new-tab"]="<Control><Shift>t" \
  ["org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ close-tab"]="<Control><Shift>w" \
  ["org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ reset-and-clear"]="<Control><Shift>k" \
)

#  ["org.gnome.Terminal.Legacy.Settings default-show-menubar"]="false" \
#  ["org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ copy"]="<Super>c" \
#  ["org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ paste"]="<Super>v" \
#  ["org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ new-tab"]="<Super>t" \
#  ["org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ close-tab"]="<Super>w" \
#  ["org.gnome.Terminal.Legacy.Keybindings:/org/gnome/terminal/legacy/keybindings/ reset-and-clear"]="<Super>k" \

declare -A profilesettings
profilesettings=( \
  ["scrollbar-policy"]="always" \
  ["scrollback-unlimited"]="true" \
  ["rewrap-on-resize"]="true" \
  ["text-blink-mode"]="never" \
  ["default-size-columns"]="120" \
  ["default-size-rows"]="30" \
  ["use-system-font"]="false" \
  ["font"]="JetBrainsMono Nerd Font Mono 13" \
  ["cursor-shape"]="block" \
  ["audible-bell"]="false" \
  ["use-theme-colors"]="false" \
  ["use-transparent-background"]="false" \
  ["background-transparency-percent"]="0" \
  ["highlight-colors-set"]="true" \
  ["highlight-foreground-color"]="$C_HFG" \
  ["highlight-background-color"]="$C_HBG" \
  ["cursor-colors-set"]="true" \
  ["cursor-background-color"]="${C_CBG:-C_HBG}" \
  ["cursor-foreground-color"]="${C_CFG:-C_HFG}" \
  ["foreground-color"]="$C_FG" \
  ["background-color"]="$C_BG" \
  ["palette"]="$C_PAL" \
)

__set-settings() {
  local PROFILE=()
  if ! PROFILE=($(__gnome_terminal_profile ${1})); then
    echo -e "\e[0;31mWrong profile name \e[1;31m${1}\e[0m"
    __gnome_terminal_profile_list
    return 1
  fi

  for KEY in "${!globalsettings[@]}"; do
    gsettings-set "${KEY}" "${globalsettings[$KEY]}"
  done

  for KEY in "${!profilesettings[@]}"; do
    gsettings-set "${PROFILE[2]} ${KEY}" "${profilesettings[$KEY]}"
  done
}

__get-settings() {
  local PROFILE=()
  if ! PROFILE=($(__gnome_terminal_profile ${1})); then
    echo -e "\e[0;31mWrong profile name \e[1;31m${1}\e[0m"
    __gnome_terminal_profile_list
    return 1
  fi

  echo -e "Profile: \e[0;94m${PROFILE[0]} \e[0m(\e[3m${PROFILE[1]}\e[0m)\e[0m"
  for KEY in "${!globalsettings[@]}"; do
    gsettings-get "${KEY}"
  done

  for KEY in "${!profilesettings[@]}"; do
    gsettings-get "${PROFILE[2]} ${KEY}"
  done
}

${func} "${1}"
