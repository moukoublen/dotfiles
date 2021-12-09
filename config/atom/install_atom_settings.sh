#!/usr/bin/env bash

mkdir -p ~/.atom

__install_settings_file() {
  local fl=$1
  local CONF_PATH=~/.atom
  [[ -f $CONF_PATH/$fl ]] && [[ ! -h $CONF_PATH/$fl ]] && mv $CONF_PATH/$fl{,.backup}
  [[ -h $CONF_PATH/$fl ]] && echo "Link for $fl already exists" && return
  ln -s $DOTFILES_PATH/config/atom/$fl $CONF_PATH/$fl
}

__install_settings_file config.cson

