install_my_atom_packages() {
  apm install \
    atom-beautify \
    file-icons \
    highlight-selected \
    language-scala \
    language-kotlin \
    linter \
    linter-ui-default \
    intentions \
    busy-signal

  #themes
  # nord-atom-syntax
  # nord-atom-ui

  # nova-atom-syntax
  # nova-atom-ui
}

_marmalade_get_latest_version_number__atom() {
  curl -s https://api.github.com/repos/atom/atom/releases/latest | jq -r '.name'
}

_marmalade_get_local_latest_version_number__atom() {
  atom -v
}

_marmalade_install__atom() {
  # $1: version e.g. 1.21.0
  # https://github.com/atom/atom/releases/download/v1.21.0/atom.x86_64.rpm
  # https://github.com/atom/atom/releases/download/v1.21.0/atom-amd64.deb

  local os_name=$(lsb_release -si)
  local package_name=""
  local install_command=""
  case "$os_name" in
    "Fedora")
      package_name="atom.x86_64.rpm"
      install_command="sudo dnf -y install"
      ;;
    "Ubuntu"|"Debian")
      package_name="atom-amd64.deb"
      install_command="sudo apt install -y"
      ;;
    *)
      package_name=""
      install_command=""
      ;;
  esac
  curl -L https://github.com/JetBrains/kotlin/releases/download/v$1/$package_name > /tmp/$package_name
  eval "$install_command" /tmp/$package_name
  rm /tmp/$package_name
}
