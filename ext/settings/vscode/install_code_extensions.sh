#!/usr/bin/env bash


# asciidoctor.asciidoctor-vscode
# bierner.markdown-mermaid
# dracula-theme.theme-dracula
# rangav.vscode-thunder-client
# scala-lang.scala
# scala-lang.scala-snippets
# streetsidesoftware.code-spell-checker

extensions=(
arcticicestudio.nord-visual-studio-code
attilathedud.data-converter
eamodio.gitlens
GitHub.github-vscode-theme
golang.go
ms-azuretools.vscode-docker
ms-python.python
ms-python.vscode-pylance
ms-toolsai.jupyter
ms-vscode.cpptools
PKief.material-icon-theme
recode4dev.jenkinsfile
redhat.vscode-commons
redhat.vscode-xml
)

for ext in "${extensions[@]}"
do
  echo "Installing $ext"
  code --install-extension $ext
done

unset extensions
unset ext
