packages=(
atom-beautify
atom-material-syntax
atom-material-syntax-dark
atom-material-ui
file-icons
highlight-selected
linter
linter-eslint
linter-ui-default
intentions
busy-signal
language-ansible
language-docker
language-gradle
language-groovy
language-jenkinsfile
language-kotlin
language-mongodb
language-scala
language-terraform
)

apm install "${packages[@]}"

unset packages
