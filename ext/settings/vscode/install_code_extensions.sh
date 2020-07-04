#!/usr/bin/env bash

extensions=(
asciidoctor.asciidoctor-vscode
dracula-theme.theme-dracula
eamodio.gitlens
GitHub.github-vscode-theme
golang.go
ms-azuretools.vscode-docker
ms-python.python
ms-vscode.cpptools
PKief.material-icon-theme
scala-lang.scala
scala-lang.scala-snippets
vscoss.vscode-ansible
)

for ext in "${extensions[@]}"
do
  echo "Installing $ext"
  code --install-extension $ext
done

unset extensions
unset ext
