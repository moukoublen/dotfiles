#!/usr/bin/env bash

gsettings-set() {
  local setting
  local value
  setting=$1
  value=$2

  echo -e "\e[2m${setting}\e[0m"

  local old_value
  old_value="$(gsettings get $setting)"
  echo -e "    old: \e[31m${old_value}\e[0m"

  # set the property; we want expansion for $setting.
  gsettings set $setting "${value}"
  if [ $? -ne 0 ]; then
    echo -e "\e[2;31m    error trying to set property\e[0m"
  fi

  local new_value
  new_value="$(gsettings get $setting)"
  echo -e "    new: \e[32m${new_value}\e[0m"
  echo ""
}

gsettings-get() {
  local setting
  local value
  setting=$1
  value="$(gsettings get $setting)"

  printf "\e[2m%s\e[0m \e[94m=>\e[0m \e[1;32m%s\e[0m\n" "${setting}" "${value}"
}


export -f gsettings-set
export -f gsettings-get
