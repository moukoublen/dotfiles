#!/usr/bin/env bash

gsettings-set() {
  setting=$1
  value=$2
  local old_value=$(gsettings get $1)
  gsettings set $1 "$2"
  printf "\e[2m%s\e[0m\n    old: \e[31m%s\e[0m \n    new: \e[32m%s\e[0m\n\n" "$setting" "$old_value" "$(gsettings get $1)"
}

gsettings-get() {
  printf "\e[2m%s\e[0m \e[94m=>\e[0m \e[1;32m%s\e[0m\n" "$1" "$(gsettings get $1)"
}


export -f gsettings-set
export -f gsettings-get
