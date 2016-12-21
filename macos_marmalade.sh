####################################################################
##################### Homebrew #####################################
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi
####################################################################
####################################################################
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

####################################################################
##################### Java #########################################
export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_112.jdk/Contents/Home'
####################################################################
####################################################################

add_to_start_of_path_if_not_exists $HOME/bin

####################################################################
##################### Homebrew coreutils findutils##################
## brew install coreutils (e.g.: cat, chmod, chroot, cp, dd, dir, du, echo, ls ... etc)
#add_to_start_of_path_if_not_exists /usr/local/opt/coreutils/libexec/gnubin

## brew install findutils (find, locate, updatedb, xargs)
#add_to_start_of_path_if_not_exists /usr/local/opt/findutils/libexec/gnubin
####################################################################
####################################################################

##################### Generic Aliases ##############################
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias cleanupFinderShit="find . -type f -name '*.DS_Store' -ls -delete"
alias ldd='otool -L'
alias grep='command grep --color=auto'
#alias ll='command ls -la --color=auto'
alias ll='command ls -laG'
####################################################################
