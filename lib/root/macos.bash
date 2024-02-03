path-add /usr/local/bin/
#path-add /usr/local/sbin

################################################################################
##################### Homebrew #################################################
#if command -v brew 1>/dev/null 2>&1; then
if [[ -d /opt/homebrew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  #export HOMEBREW_PREFIX="/opt/homebrew"
  #export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
  #export HOMEBREW_REPOSITORY="/opt/homebrew"
  #export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}"
  #export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
  #export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"

  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    export BASH_COMPLETION_COMPAT_DIR="${HOMEBREW_PREFIX}/etc/bash_completion.d"
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  fi
fi

################################################################################
################################################################################

#export JAVA_HOME='/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home'

alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
#alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'
alias cleanup_finder_shit="find . -type f -name '*.DS_Store' -ls -delete"
alias ldd='otool -L'
alias tree='command tree -C'
alias allow='xattr -r -d com.apple.quarantine'

if [[ -d ${HOMEBREW_PREFIX}/opt/grep/libexec/gnubin ]]; then
  alias grep='command ggrep --color=auto'
else
  alias grep='command grep --color=auto'
fi

# PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
if [[ -d ${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin ]]; then
  alias ll='command gls -la --color=auto'
  alias ls='command gls --color=auto'
  alias cat='command gcat'
  [[ -e "${HOME}/.dir_colors" ]] && eval "$(gdircolors ~/.dir_colors)"
else
  alias ll='command ls -laG'
  alias ls='command ls -G'
fi

# brew install findutils (find, locate, updatedb, xargs)
# [[ -d "${HOMEBREW_PREFIX}/opt/findutils/libexec/gnubin" ]] && path-add "${HOMEBREW_PREFIX}/opt/findutils/libexec/gnubin"

if [[ -d "${HOMEBREW_PREFIX}/opt/make/libexec/gnubin" ]]; then
  alias make='command gmake'
fi

if [[ -d "${HOMEBREW_PREFIX}/opt/gnu-sed/libexec/gnubin" ]]; then
  alias sed='command gsed'
fi

if [[ -d "${HOMEBREW_PREFIX}/opt/curl/bin" ]]; then
  alias curl="\${HOMEBREW_PREFIX}/opt/curl/bin/curl"
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

sizes-files() {
  du -h -d 1 | sort --human-numeric-sort --reverse
}
export -f sizes-files
sizes-disks() {
  df -h -Y
}
export -f sizes-disks

export EDITOR="${HOMEBREW_PREFIX}/bin/vim"

# brew list installed package content
# brew ls --verbose <name/s>
