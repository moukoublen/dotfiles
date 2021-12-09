#!/usr/bin/env bash

# code
mkdir -p ~/.config/Code/User

__install_settings_file() {
  local fl=$1
  local VSCODE_CONF_PATH=~/.config/Code/User/
  [[ -f $VSCODE_CONF_PATH/$fl ]] && [[ ! -h $VSCODE_CONF_PATH/$fl ]] && mv $VSCODE_CONF_PATH/$fl{,.backup}
  [[ -h $VSCODE_CONF_PATH/$fl ]] && echo "Link for $fl already exists" && return
  ln -s $DOTFILES_PATH/config/vscode/$fl $VSCODE_CONF_PATH/$fl
}

__install_settings_file settings.json
__install_settings_file keybindings.json
