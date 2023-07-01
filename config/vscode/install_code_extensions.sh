#!/usr/bin/env bash


extensions=(
anweber.vscode-httpyac
attilathedud.data-converter
eamodio.gitlens
GitHub.github-vscode-theme
github.vscode-github-actions
golang.go
GraphQL.vscode-graphql
GraphQL.vscode-graphql-execution
GraphQL.vscode-graphql-syntax
hashicorp.hcl
hashicorp.terraform
inferrinizzard.prettier-sql-vscode
mitchdenny.ecdc
ms-azuretools.vscode-docker
ms-kubernetes-tools.vscode-kubernetes-tools
ms-vscode-remote.remote-containers
redhat.vscode-xml
redhat.vscode-yaml
rust-lang.rust-analyzer
streetsidesoftware.code-spell-checker
streetsidesoftware.code-spell-checker-greek
tamasfe.even-better-toml
vscode-icons-team.vscode-icons
zhuangtongfa.material-theme
)

for ext in "${extensions[@]}"
do
  echo "Installing $ext"
  code --install-extension $ext
done

unset extensions
unset ext
