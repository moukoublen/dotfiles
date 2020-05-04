packages=(
atom-beautify
atom-material-syntax
atom-material-syntax-dark
atom-material-ui
busy-signal
file-icons
highlight-selected
intentions
language-ansible
language-docker
language-gradle
language-groovy
language-jenkinsfile
language-kotlin
language-mongodb
language-scala
language-terraform
linter
linter-eslint
linter-ui-default
)

apm install "${packages[@]}"

unset packages
