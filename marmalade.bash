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

path-real() {
  local SOURCE="$1"
  while [[ -L $SOURCE ]]; do
    local DIR="$(path-abs $SOURCE)"
    SOURCE="$(readlink --canonicalize-existing --no-newline $SOURCE)"
    [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE
  done
  echo "$(path-abs $SOURCE)"
}

export DOTFILES_PATH="$(path-real ${BASH_SOURCE[0]})"

alias to-ack='ack --files-from=-' #pipe find results
alias to-grep='xargs grep --color=auto' #pipe find results
alias path-to-lines='echo $PATH | tr ":" "\n"'
alias ld-to-lines='echo $LD_LIBRARY_PATH | tr ":" "\n"'

S() {
  find . -name "*$@*"
}


################################################################################
######### Source libs ##########################################################
source $DOTFILES_PATH/lib/ps1.bash
source $DOTFILES_PATH/lib/pathmixer.bash

if [[ $(uname) = "Darwin" ]]; then
  source $DOTFILES_PATH/lib/macos_marmalade.bash
fi

if [[ $(uname) = "Linux" ]]; then
  source $DOTFILES_PATH/lib/linux_marmalade.bash
fi

for e in $( ls $HOME/.dotfiles-extras/* 2>/dev/null ); do
  source $e
done

for e in $( ls $DOTFILES_PATH/extras-* 2>/dev/null ); do
  source $e
done
################################################################################
################################################################################


add_to_path $DOTFILES_PATH/bin
