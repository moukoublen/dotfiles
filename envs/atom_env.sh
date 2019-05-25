install_my_atom_packages() {
  apm install \
    atom-beautify \
    atom-material-syntax \
    atom-material-syntax-dark \
    atom-material-ui \
    file-icons \
    highlight-selected \
    linter \
    linter-eslint \
    linter-ui-default \
    intentions \
    busy-signal \
    language-ansible \
    language-docker \
    language-gradle \
    language-groovy \
    language-jenkinsfile \
    language-kotlin \
    language-mongodb \
    language-scala \
    language-terraform
}

_marmalade_get_latest_version_number__atom() {
  curl -s https://api.github.com/repos/atom/atom/releases/latest | jq -r '.name'
}

_marmalade_get_local_latest_version_number__atom() {
  atom -v | awk 'NR==1{print $3}'
}

_marmalade_install__atom() {
  # $1: version e.g. 1.21.0
  # https://github.com/atom/atom/releases/download/v1.21.0/atom.x86_64.rpm
  # https://github.com/atom/atom/releases/download/v1.21.0/atom-amd64.deb

  local os_name=$(lsb_release -is)
  local package_name=""
  local install_command=""
  case "$os_name" in
    "Fedora")
      package_name="atom.x86_64.rpm"
      install_command="sudo dnf -y install"
      ;;
    "Ubuntu"|"Debian"|"LinuxMint")
      package_name="atom-amd64.deb"
      install_command="sudo apt install -y"
      ;;
    *)
      package_name=""
      install_command=""
      ;;
  esac
  echo "Downloading: https://github.com/atom/atom/releases/download/v$1/$package_name"
  curl -L --fail https://github.com/atom/atom/releases/download/v$1/$package_name > /tmp/$package_name
  eval "$install_command" /tmp/$package_name
  rm /tmp/$package_name
}
