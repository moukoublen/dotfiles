####################################################################
## Homebrew ########################################################
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi
####################################################################
####################################################################
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

add_to_start_of_path_if_not_exists $HOME/bin

# brew install coreutils (e.g.: cat, chmod, chroot, cp, dd, dir, du, echo, ls ... etc)
add_to_start_of_path_if_not_exists /usr/local/opt/coreutils/libexec/gnubin

# brew install findutils (find, locate, updatedb, xargs)
add_to_start_of_path_if_not_exists /usr/local/opt/findutils/libexec/gnubin

alias cleanupFinderShit="find . -type f -name '*.DS_Store' -ls -delete"
alias ldd='otool -L'
alias ll='command ls -la --color=auto'
alias grep='grep --color=auto'
