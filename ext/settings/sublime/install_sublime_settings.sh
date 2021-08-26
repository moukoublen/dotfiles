#!/usr/bin/env bash

mkdir -p ~/.config/sublime-text/Packages/User
cp ~/.config/sublime-text/Packages/User/Preferences.sublime-settings ~/.config/sublime-text/Packages/User/Preferences.sublime-settings.backup
rm ~/.config/sublime-text/Packages/User/Preferences.sublime-settings
ln -s $MARMALADE_PATH/ext/settings/sublime/Preferences.sublime-settings ~/.config/sublime-text/Packages/User/
