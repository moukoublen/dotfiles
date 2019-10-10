################################################################################
##################### Homebrew #################################################

## Settings #####################################
M_BREW_COREUTILS_USED=false
M_BREW_FINDUTILS_USED=false
#################################################
M_HAS_BREW_INSTALLED=false
M_BREW_PREFIX=""
if command -v brew 1>/dev/null 2>&1; then
  M_HAS_BREW_INSTALLED=true
  M_BREW_PREFIX=$(brew --prefix)
fi

if [[ ($M_HAS_BREW_INSTALLED = true) && ($BASH_VERSION == 3.*) && (-r $M_BREW_PREFIX/etc/profile.d/bash_completion.sh) ]]; then
  source $M_BREW_PREFIX/etc/profile.d/bash_completion.sh
fi

# if bash is 4+ (brew) then use bash-completion@2
if [[ ($M_HAS_BREW_INSTALLED = true) && (($BASH_VERSION == 4.*) || ($BASH_VERSION == 5.*)) && (-r $M_BREW_PREFIX/etc/profile.d/bash_completion.sh) ]]; then
  export BASH_COMPLETION_COMPAT_DIR=$M_BREW_PREFIX/etc/bash_completion.d
  source $M_BREW_PREFIX/etc/profile.d/bash_completion.sh
fi

# brew install coreutils (e.g.: cat, chmod, chroot, cp, dd, dir, du, echo, ls)
if [[ $M_BREW_COREUTILS_USED = true ]]; then
  add_to_path /usr/local/opt/coreutils/libexec/gnubin
fi

# brew install findutils (find, locate, updatedb, xargs)
if [[ $M_BREW_FINDUTILS_USED = true ]]; then
  add_to_path /usr/local/opt/findutils/libexec/gnubin
fi

if [[ $M_HAS_BREW_INSTALLED = true ]] && [[ -f $M_BREW_PREFIX/opt/nvm/nvm.sh ]]; then
  export NVM_DIR=~/.nvm
  source $M_BREW_PREFIX/opt/nvm/nvm.sh
  [[ -s "$M_BREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ]] && source "$M_BREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"
fi

################################################################################
################################################################################


################################################################################
##################### Java #####################################################

export JAVA_HOME='/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home'

################################################################################
################################################################################


################################################################################
##################### Aliases ##################################################

#alias atom='/Applications/Atom.app/Contents/Resources/app/atom.sh'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'
alias meld='/Applications/Meld.app/Contents/MacOS/Meld'
alias cleanup_finder_shit="find . -type f -name '*.DS_Store' -ls -delete"
alias ldd='otool -L'
alias grep='command grep --color=auto'
alias tree='command tree -C'
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

if [ -f /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion ]; then
  source /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion
fi

if [ -f /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion ]; then
  source /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion
fi

if [ -f /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion ]; then
  source /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion
fi

#source $MARMALADE_PATH/envs/pyenv_env.sh
#source $MARMALADE_PATH/envs/rbenv_env.sh
source $MARMALADE_PATH/envs/go_env.sh
source $MARMALADE_PATH/envs/docker_env.sh
source $MARMALADE_PATH/envs/php_env.sh

install_nano_nanorc() {
  touch ~/.nanorc
  for rcfile in $(brew --prefix nano)/share/nano/*.nanorc; do
    echo "include $rcfile" >> ~/.nanorc
  done
}
