#!/usr/bin/env bash

extensions=(
ms-azuretools.vscode-docker
ms-python.python
ms-vscode.Go
PKief.material-icon-theme
scala-lang.scala
scala-lang.scala-snippets
vscode-icons-team.vscode-icons
vscoss.vscode-ansible
)

for ext in "${extensions[@]}"
do
    echo "Installing $ext"
    code --install-extension $ext
done

unset extensions
unset ext
