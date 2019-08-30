################################################################################
##################### Homebrew #################################################

## Settings #####################################
M_BREW_COREUTILS_USED=false
M_BREW_FINDUTILS_USED=false
#################################################

if [[ ($BASH_VERSION == 3.*) && (-r $(brew --prefix)/etc/profile.d/bash_completion.sh) ]]; then
  source $(brew --prefix)/etc/profile.d/bash_completion.sh
fi

# if bash is 4+ (brew) then use bash-completion@2
if [[ (($BASH_VERSION == 4.*) || ($BASH_VERSION == 5.*)) && (-r $(brew --prefix)/etc/profile.d/bash_completion.sh) ]]; then
  export BASH_COMPLETION_COMPAT_DIR=$(brew --prefix)/etc/bash_completion.d
  . $(brew --prefix)/etc/profile.d/bash_completion.sh
fi

## brew install coreutils (e.g.: cat, chmod, chroot, cp, dd, dir, du, echo, ls)
if [[ $M_BREW_COREUTILS_USED ]]; then
  add_to_path /usr/local/opt/coreutils/libexec/gnubin
fi

## brew install findutils (find, locate, updatedb, xargs)
if [[ $M_BREW_FINDUTILS_USED ]]; then
  add_to_path /usr/local/opt/findutils/libexec/gnubin
fi
################################################################################
################################################################################

################################################################################
##################### Java #####################################################
export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_221.jdk/Contents/Home'
################################################################################
################################################################################

################################################################################
##################### Aliases ##################################################
#alias atom='/Applications/Atom.app/Contents/Resources/app/atom.sh'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'
alias cleanup_finder_shit="find . -type f -name '*.DS_Store' -ls -delete"
alias ldd='otool -L'
alias grep='command grep --color=auto'
if [[ $M_BREW_COREUTILS_USED = true ]]; then
  alias ll='command ls -la --color=auto'
  alias ls='command ls --color=auto'
else
  alias ll='command ls -laG'
  alias ls='command ls -G'
fi
################################################################################
################################################################################

export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

add_to_path $HOME/bin

#. $MARMALADE_PATH/envs/pyenv_env.sh
#. $MARMALADE_PATH/envs/rbenv_env.sh

if [ -f /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion ]; then
  . /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion
fi

if [ -f /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion ]; then
  . /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion
fi

if [ -f /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion ]; then
  . /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion
fi
