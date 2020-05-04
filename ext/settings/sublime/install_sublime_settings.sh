#!/usr/bin/env bash

mkdir -p ~/.config/sublime-text-3/Packages/User
cp ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings.backup
rm ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
ln -s $MARMALADE_PATH/ext/settings/sublime/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/
