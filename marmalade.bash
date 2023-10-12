################################################################################
# Put this in ~/.bashrc or ~/.bash_profile
#
# [[ -r ~/.marmalade.sh ]] && [[ -f ~/.marmalade.sh ]] && source ~/.marmalade.sh
#
################################################################################
path-abs() {
  local drnm="$(dirname $1)"
  echo $(cd -P $drnm && pwd)
}

path-read-link() {
  case "$(uname)" in
    "Darwin")
      readlink -n $1
      ;;
    "Linux")
      readlink --canonicalize-existing --no-newline $1
      ;;
  esac
}

path-real() {
  local SOURCE="$1"
  while [[ -L $SOURCE ]]; do
    local DIR="$(path-abs $SOURCE)"
    SOURCE="$(path-read-link $SOURCE)"
    [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE
  done
  echo "$(path-abs $SOURCE)"
}

export DOTFILES_PATH="$(path-real ${BASH_SOURCE[0]})"

alias gcl='git config --local --list'
alias exa-tree='command exa --tree --icons --git-ignore'
alias to-ack='ack --files-from=-' #pipe find results
alias to-grep='xargs grep --color=auto' #pipe find results
alias path-to-lines='echo $PATH | tr ":" "\n"'
alias ld-to-lines='echo $LD_LIBRARY_PATH | tr ":" "\n"'
S() {
  find . -name "*$@*"
}


################################################################################
######### Source libs ##########################################################
source "${DOTFILES_PATH}/lib/pathmixer.bash"

if command -v starship &> /dev/null; then
  export STARSHIP_CONFIG="${DOTFILES_PATH}/config/starship/starship.toml"
  eval "$(starship init bash)"
else
  source "${DOTFILES_PATH}/lib/ps1.bash"
fi


if [[ $(uname) = "Darwin" ]]; then
  source "${DOTFILES_PATH}/lib/macos_marmalade.bash"
fi

if [[ $(uname) = "Linux" ]]; then
  source "${DOTFILES_PATH}/lib/linux_marmalade.bash"
fi

for e in $( ls ${HOME}/.dotfiles-extras/* 2>/dev/null ); do
  source $e
done

for e in $( ls ${DOTFILES_PATH}/extras-* 2>/dev/null ); do
  source $e
done
################################################################################
################################################################################


add_to_path ${DOTFILES_PATH}/bin

bind 'set mark-symlinked-directories on'

HISTSIZE=11000
HISTFILESIZE=11000

complete -c ww
