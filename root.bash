path-abs() {
  cd -P "$(dirname "${1}")" && pwd
}

path-read-link() {
  case "$(uname)" in
    "Darwin")
      readlink -n "${1}"
      ;;
    "Linux")
      readlink --canonicalize-existing --no-newline "${1}"
      ;;
  esac
}

path-real() {
  local SOURCE="${1}"
  while [[ -L "${SOURCE}" ]]; do
    SOURCE="$(path-read-link "${SOURCE}")"
    [[ "${SOURCE}" != /* ]] && SOURCE="$(path-abs "${SOURCE}")/${SOURCE}"
  done
  path-abs "${SOURCE}"
}

DOTFILES_PATH="$(path-real "${BASH_SOURCE[0]}")"
export DOTFILES_PATH

################################################################################
######### Source libs ##########################################################
for i in "${DOTFILES_PATH}"/lib/*.bash
do
  if [ -r "${i}" ]; then
    source "${i}"
  fi
done

complete -c ww



if command -v starship &> /dev/null; then
  export STARSHIP_CONFIG="${DOTFILES_PATH}/config/starship/starship.toml"
  eval "$(starship init bash)"
else
  source "${DOTFILES_PATH}/lib/root/ps1.bash"
fi



for e in "${HOME}"/.dotfiles-extras/*
do
  source "${e}"
done 2>/dev/null

for e in "${DOTFILES_PATH}"/extras-*
do
  source "${e}"
done 2>/dev/null
################################################################################
################################################################################

path-add "${DOTFILES_PATH}/bin"
path-add "${HOME}/bin"

bind 'set mark-symlinked-directories on'

HISTSIZE=30000
HISTFILESIZE=30000

alias path-to-lines='echo $PATH | tr ":" "\n"'
alias xdg-data-to-lines='echo $XDG_DATA_DIRS | tr ":" "\n"'
alias infopath-to-lines='echo $INFOPATH | tr ":" "\n"'
alias ld-to-lines='echo $LD_LIBRARY_PATH | tr ":" "\n"'
S() {
  find . -name "*${*}*"
}
