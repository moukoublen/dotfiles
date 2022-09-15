#!/usr/bin/env bash


extensions=(
anweber.vscode-httpyac
attilathedud.data-converter
eamodio.gitlens
Equinusocio.vsc-community-material-theme
Equinusocio.vsc-material-theme
equinusocio.vsc-material-theme-icons
GitHub.github-vscode-theme
golang.go
GraphQL.vscode-graphql
GraphQL.vscode-graphql-syntax
hashicorp.terraform
mitchdenny.ecdc
ms-azuretools.vscode-docker
ms-vscode-remote.remote-containers
redhat.vscode-yaml
streetsidesoftware.code-spell-checker
vscode-icons-team.vscode-icons
)

for ext in "${extensions[@]}"
do
  echo "Installing $ext"
  code --install-extension $ext
done

unset extensions
unset ext
