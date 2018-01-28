################################################################################
##################### Homebrew #################################################
if [[ $BASH_VERSION == 3.* && -f $(brew --prefix)/etc/bash_completion ]]; then
  source $(brew --prefix)/etc/bash_completion
fi

# if bash is 4+ (brew) then use bash-completion@2
if [[ $BASH_VERSION == 4.* && -f $(brew --prefix)/share/bash-completion/bash_completion ]]; then
  . $(brew --prefix)/share/bash-completion/bash_completion
fi


## coreutils findutils ##
## brew install coreutils (e.g.: cat, chmod, chroot, cp, dd, dir, du, echo, ls)
#add_to_start_of_path_if_not_exists /usr/local/opt/coreutils/libexec/gnubin

## brew install findutils (find, locate, updatedb, xargs)
#add_to_start_of_path_if_not_exists /usr/local/opt/findutils/libexec/gnubin
################################################################################
################################################################################

################################################################################
##################### Java #####################################################
export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_152.jdk/Contents/Home'
################################################################################
################################################################################

################################################################################
##################### Aliases ##################################################
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias cleanup_finder_shit="find . -type f -name '*.DS_Store' -ls -delete"
alias ldd='otool -L'
alias grep='command grep --color=auto'
#alias ll='command ls -la --color=auto'
#alias ls='command ls --color=auto'
alias ll='command ls -laG'
alias ls='command ls -G'
################################################################################
################################################################################


#export LANG='en_US.UTF-8';
#export LC_ALL='en_US.UTF-8';

add_to_start_of_path_if_not_exists $HOME/bin

. $MARMALADE_PATH/envs/pyenv_env.sh
. $MARMALADE_PATH/envs/rbenv_env.sh
