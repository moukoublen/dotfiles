################################################################################
# Put this in ~/.bashrc or ~/.bash_profile
#
# [[ -r ~/.marmalade.sh ]] && [[ -f ~/.marmalade.sh ]] && source ~/.marmalade.sh
#
################################################################################
export MARMALADE_PATH=$(realpath ~/.marmalade.sh | sed 's/\/marmalade.sh//g')

source $MARMALADE_PATH/pathmixer.sh

# Mac or Linux?
if [ "$(uname)" == "Darwin" ]; then
  source $MARMALADE_PATH/macos_marmalade.sh
else
  source $MARMALADE_PATH/linux_marmalade.sh
fi

if [ -f $MARMALADE_PATH/extras_marmalade.sh ]; then
  source $MARMALADE_PATH/extras_marmalade.sh
fi

################################################################################
######### Colors PS1 ###########################################################
alias minimal_ps1="PS1='$ '"

_parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

_set_color_ps1() {
  local F_PATH='\[\033[32m\]'
  local F_GIT_BRANCH='\[\033[93;1m\]'
  local F_MAIN='\[\033[36m\]'
  local RESET_ALL='\[\033[0m\]'
  if [[ ! -z $BASH ]]; then
    export PS1="${F_MAIN}╭ \u@\h${RESET_ALL} ${F_PATH}\w${RESET_ALL} ${F_GIT_BRANCH}\$(_parse_git_branch)${RESET_ALL}\n${F_MAIN}╰${RESET_ALL} "
  fi
}

_set_color_ps1
################################################################################
################################################################################

################################################################################
######### Aliases ##############################################################
alias path_to_lines='echo $PATH | tr ":" "\n"'
alias ld_to_lines='echo $LD_LIBRARY_PATH | tr ":" "\n"'
alias update_marmalade="(cd ${MARMALADE_PATH}; git pull)"
################################################################################
################################################################################

load_path_file_to_path
unset MARMALADE_PATH
