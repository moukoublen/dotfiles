#!/usr/bin/env bash

extensions=(
ms-python.python
ms-vscode.csharp
PeterJausovec.vscode-docker
PKief.material-icon-theme
scala-lang.scala
)

for ext in "${extensions[@]}"
do
    echo "Installing $ext"
    code --install-extension $ext
done

unset extensions
unset ext
