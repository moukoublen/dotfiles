####################################################################
## Homebrew ########################################################
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi
####################################################################
####################################################################

alias cleanupFinderShit="find . -type f -name '*.DS_Store' -ls -delete"
alias ldd='otool -L'
alias ll='ls -la --color=auto'
alias grep='grep --color=auto'

add_to_start_of_path_if_not_exists $HOME/bin
add_to_start_of_path_if_not_exists /usr/local/opt/coreutils/libexec/gnubin
add_to_start_of_path_if_not_exists /usr/local/opt/findutils/libexec/gnubin

export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';
