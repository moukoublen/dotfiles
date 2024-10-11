#!/usr/bin/env bash

# https://linuxcommand.org/lc3_man_pages/readh.html
# Options:
#   -a array  assign the words read to sequential indices of the array
#     variable ARRAY, starting at zero
#   -r  do not allow backslashes to escape any characters
#   -s  do not echo input coming from a terminal

gsettings-set() {
  local setting
  local value
  read -r -a setting <<<"${1}"
  value="${2}"

  echo -e "\e[2m${setting[*]}\e[0m"

  local old_value
  old_value="$(gsettings get "${setting[@]}")"
  echo -e "    old: \e[31m${old_value}\e[0m"

  gsettings set "${setting[@]}" "${value}"
  if [ $? -ne 0 ]; then
    echo -e "\e[2;31m    error trying to set property\e[0m"
  fi

  local new_value
  new_value="$(gsettings get "${setting[@]}")"
  echo -e "    new: \e[32m${new_value}\e[0m"
  echo ""
}

gsettings-get() {
  local setting
  local value
  read -r -a setting <<<"${1}"
  value="$(gsettings get "${setting[@]}")"

  printf "\e[2m%s\e[0m \e[94m=>\e[0m \e[1;32m%s\e[0m\n" "${setting[*]}" "${value}"
}

export -f gsettings-set
export -f gsettings-get
