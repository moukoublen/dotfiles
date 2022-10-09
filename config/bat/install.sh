#!/usr/bin/env bash

# code
mkdir -p ~/.config/bat/

__install_config_file() {
  local fl=$1
  local CONF_PATH=~/.config/bat
  [[ -f $CONF_PATH/$fl ]] && [[ ! -h $CONF_PATH/$fl ]] && mv $CONF_PATH/$fl{,.backup}
  [[ -h $CONF_PATH/$fl ]] && echo "Link for $fl already exists" && return
  ln -s $DOTFILES_PATH/config/bat/$fl $CONF_PATH/$fl
}

__install_config_file config

