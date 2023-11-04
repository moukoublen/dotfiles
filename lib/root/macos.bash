################################################################################
##################### Homebrew #################################################
M_HAS_BREW_INSTALLED=false
M_BREW_PREFIX=""
if command -v brew 1>/dev/null 2>&1; then
  M_HAS_BREW_INSTALLED=true
  M_BREW_PREFIX=$(brew --prefix) # /opt/homebrew
  #add_to_path /usr/local/sbin
fi

if [[ ${M_HAS_BREW_INSTALLED} = true ]] && [[ -r "${M_BREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
  export BASH_COMPLETION_COMPAT_DIR="${M_BREW_PREFIX}/etc/bash_completion.d"
  source "${M_BREW_PREFIX}/etc/profile.d/bash_completion.sh"
fi

# brew install coreutils (e.g.: cat, chmod, chroot, cp, dd, dir, du, echo, ls)
# [[ -d ${M_BREW_PREFIX}/opt/coreutils/libexec/gnubin ]] && add_to_path "${M_BREW_PREFIX}/opt/coreutils/libexec/gnubin"

# brew install findutils (find, locate, updatedb, xargs)
# [[ -d ${M_BREW_PREFIX}/opt/findutils/libexec/gnubin ]] && add_to_path "${M_BREW_PREFIX}/opt/findutils/libexec/gnubin"

################################################################################
################################################################################

#export JAVA_HOME='/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home'

alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
#alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'
alias cleanup_finder_shit="find . -type f -name '*.DS_Store' -ls -delete"
alias ldd='otool -L'
alias tree='command tree -C'
alias allow='xattr -r -d com.apple.quarantine'

if [[ -d ${M_BREW_PREFIX}/opt/grep/libexec/gnubin ]]; then
  alias grep='command ggrep --color=auto'
else
  alias grep='command grep --color=auto'
fi

if [[ -d ${M_BREW_PREFIX}/opt/coreutils/libexec/gnubin ]]; then
  alias ll='command gls -la --color=auto'
  alias ls='command gls --color=auto'
else
  alias ll='command ls -laG'
  alias ls='command ls -G'
fi

if [[ -d ${M_BREW_PREFIX}/opt/make/libexec/gnubin ]]; then
  alias make='command gmake'
fi

if [[ -d ${M_BREW_PREFIX}/opt/gnu-sed/libexec/gnubin ]]; then
  alias sed='command gsed'
fi

if [[ -d ${M_BREW_PREFIX}/opt/curl/bin ]]; then
  alias curl="${M_BREW_PREFIX}/opt/curl/bin/curl"
fi

export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

install-nano-nanorc() {
  touch ~/.nanorc
  for rcfile in "$(brew --prefix nano)"/share/nano/*.nanorc; do
    echo "include ${rcfile}" >> ~/.nanorc
  done
}

alias uu='brew update && brew upgrade && brew cleanup'