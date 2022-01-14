#!/usr/bin/env bash


# asciidoctor.asciidoctor-vscode
# bierner.markdown-mermaid
# dracula-theme.theme-dracula
# rangav.vscode-thunder-client
# scala-lang.scala
# scala-lang.scala-snippets
# streetsidesoftware.code-spell-checker
# ms-python.python
# ms-python.vscode-pylance
# ms-toolsai.jupyter
# ms-vscode.cpptools
# PKief.material-icon-theme
# recode4dev.jenkinsfile
# redhat.vscode-commons
# redhat.vscode-xml
# arcticicestudio.nord-visual-studio-code



extensions=(
attilathedud.data-converter
eamodio.gitlens
GitHub.github-vscode-theme
golang.go
GraphQL.vscode-graphql
humao.rest-client
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
