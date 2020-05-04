#!/usr/bin/env bash

# code
mkdir -p ~/.config/Code/User
cp ~/.config/Code/User/settings.json ~/.config/Code/User/settings.json.backup
rm ~/.config/Code/User/settings.json
ln -s $MARMALADE_PATH/settings/vscode/settings.json ~/.config/Code/User/
