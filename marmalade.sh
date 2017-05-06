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
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

format_ps1() {
  local F_PATH='\[\033[32m\]'
  local F_GIT_BRANCH='\[\033[93;1m\]'
  local F_MAIN='\[\033[36m\]'
  local RESET_ALL='\[\033[0m\]'
  if [[ ! -z $BASH ]]; then
    export PS1="${F_MAIN}╭ \u@\h${RESET_ALL} ${F_PATH}\w${RESET_ALL} ${F_GIT_BRANCH}\$(parse_git_branch)${RESET_ALL}\n${F_MAIN}╰${RESET_ALL} "
  fi
}

format_ps1
################################################################################
################################################################################

################################################################################
######### Aliases ##############################################################
alias path_to_lines='echo $PATH | tr ":" "\n"'
alias ld_to_lines='echo $LD_LIBRARY_PATH | tr ":" "\n"'
alias update_marmalade="cd ${MARMALADE_PATH}; git pull"
################################################################################
################################################################################

################################################################################
######### Go Language ##########################################################
# No need of GOROOT in case of default path (/usr/local/go)
#export GOROOT=/path/to/special/go
add_to_start_of_path_if_not_exists /usr/local/go/bin
export GOPATH=$HOME/goworkspace
alias set_gopath_bin_to_path='export PATH=$PATH:$GOPATH/bin'
################################################################################
################################################################################

################################################################################
######### Vagrant ##############################################################
alias vm_vagrant_init_up_centos7='vagrant init centos/7; vagrant up --provider virtualbox'
alias vm_vagrant_init_up_ubuntu1604='vagrant init ubuntu/xenial64; vagrant up --provider virtualbox'
alias vm_vagrant_init_up_ubuntu1404='vagrant init ubuntu/trusty64; vagrant up --provider virtualbox'
alias vm_vagrant_clean_old_boxes='vagrant box prune'
################################################################################
################################################################################

################################################################################
######### rbenv ################################################################
# git clone https://github.com/rbenv/rbenv.git ~/.rbenv
# git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
if [ -z ${RBENV_SHELL+x} ] # run rbenv init if it has not been run already
then
  add_to_start_of_path_if_not_exists $HOME/.rbenv/bin
  if which rbenv > /dev/null 2>&1; then eval "$(rbenv init -)"; fi
fi
alias update_rbenv='(cd ~/.rbenv/; git pull; cd ~/.rbenv/plugins/ruby-build/; git pull)'
################################################################################
################################################################################

################################################################################
######### pyenv ################################################################
# git clone https://github.com/yyuu/pyenv.git ~/.pyenv
if [ -z ${PYENV_SHELL+x} ]  # run pyenv init if it has not been run already
then
  export PYENV_ROOT="$HOME/.pyenv"
  add_to_start_of_path_if_not_exists $PYENV_ROOT/bin
  if which pyenv > /dev/null 2>&1; then eval "$(pyenv init -)"; fi
fi
alias update_pyenv='(cd ~/.pyenv/; git pull)'
################################################################################
################################################################################


load_path_file_to_path
unset MARMALADE_PATH
