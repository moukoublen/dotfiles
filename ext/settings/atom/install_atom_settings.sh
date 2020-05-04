#!/usr/bin/env bash

# atom
mkdir -p ~/.atom
cp ~/.atom/config.cson ~/.atom/config.cson.backup
rm ~/.atom/config.cson
ln -s $MARMALADE_PATH/ext/settings/atom/config.cson ~/.atom/
