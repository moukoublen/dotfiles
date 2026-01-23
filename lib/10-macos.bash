if [[ $(uname) != "Darwin" ]]; then
  return 0
fi

path-add /usr/local/bin/
#path-add /usr/local/sbin

#export JAVA_HOME='/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home'

# alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias ldd='otool -L'
alias mac-no-quarantine='xattr -r -d com.apple.quarantine'

if [[ -d "${HOMEBREW_PREFIX}/opt/grep/libexec/gnubin" ]]; then
  # path-add "${HOMEBREW_PREFIX}/opt/grep/libexec/gnubin"
  alias grep='command ggrep --color=auto'
else
  alias grep='command grep --color=auto'
fi

if [[ -d "${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin" ]]; then
  # path-add "${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin"
  alias ll='command gls -la --color=auto'
  alias ls='command gls --color=auto'
  alias cat='command gcat'
  [[ -e "${HOME}/.dir_colors" ]] && eval "$(gdircolors --bourne-shell ~/.dir_colors)"
else
  alias ll='command ls -laG'
  alias ls='command ls -G'
fi

if [[ -d "${HOMEBREW_PREFIX}/opt/findutils/bin" ]]; then
  # path-add "${HOMEBREW_PREFIX}/opt/findutils/libexec/gnubin"
  alias find='command gfind'
fi

if [[ -d "${HOMEBREW_PREFIX}/opt/make/libexec/gnubin" ]]; then
  # path-add "${HOMEBREW_PREFIX}/opt/make/libexec/gnubin"
  alias make='command gmake'
fi

if [[ -d "${HOMEBREW_PREFIX}/opt/gnu-sed/libexec/gnubin" ]]; then
  # path-add "${HOMEBREW_PREFIX}/opt/gnu-sed/libexec/gnubin"
  alias sed='command gsed'
fi

if [[ -d "${HOMEBREW_PREFIX}/opt/curl/bin" ]]; then
  # path-add "${HOMEBREW_PREFIX}/opt/curl/bin"
  alias curl="\${HOMEBREW_PREFIX}/opt/curl/bin/curl"
fi

if [[ -d "${HOMEBREW_PREFIX}/opt/tree/bin" ]]; then
  # path-add "${HOMEBREW_PREFIX}/opt/tree/bin"
  alias tree="\${HOMEBREW_PREFIX}/opt/tree/bin/tree -C"
fi

export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

install-nano-nanorc() {
  touch ~/.nanorc
  for rcfile in "$(brew --prefix nano)"/share/nano/*.nanorc; do
    echo "include ${rcfile}" >>~/.nanorc
  done
}

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

cleanup-finder-shit() {
  find . -type f -name '*.DS_Store' -ls -delete
}
