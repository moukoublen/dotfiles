if [[ $(uname) != "Darwin" ]]; then
  return 0
fi

#path-add /usr/local/bin/
#path-add /usr/local/sbin

# alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias ldd='otool -L'

mac-gnu() {
  path-add "${HOMEBREW_PREFIX}/opt/coreutils/libexec/gnubin"
  path-add "${HOMEBREW_PREFIX}/opt/gnu-tar/libexec/gnubin"
  path-add "${HOMEBREW_PREFIX}/opt/grep/libexec/gnubin"
  path-add "${HOMEBREW_PREFIX}/opt/gnu-sed/libexec/gnubin"
  path-add "${HOMEBREW_PREFIX}/opt/gawk/libexec/gnubin"
  path-add "${HOMEBREW_PREFIX}/opt/make/libexec/gnubin"
  path-add "${HOMEBREW_PREFIX}/opt/findutils/libexec/gnubin"
  path-add "${HOMEBREW_PREFIX}/opt/gnu-which/libexec/gnubin"
  path-add "${HOMEBREW_PREFIX}/opt/curl/bin"
}

# alias ll='command ls -laG'
# alias ls='command ls -G'
alias ll='command gls -la --color=auto'
alias ls='command gls --color=auto'
alias cat='command gcat'
[[ -e "${HOME}/.dir_colors" ]] && eval "$(gdircolors --bourne-shell ~/.dir_colors)"
# alias grep='command grep --color=auto'
alias grep='command ggrep --color=auto'
alias find='command gfind'
alias make='command gmake'
alias curl="\${HOMEBREW_PREFIX}/opt/curl/bin/curl"

# export LC_ALL='en_US.UTF-8'
# export LANG='en_US.UTF-8'

install-nano-nanorc() {
  # /opt/homebrew/share/doc/nano/sample.nanorc
  touch ~/.nanorc
  echo '' > ~/.nanorc
  for rcfile in "$(brew --prefix nano)"/share/nano/*.nanorc; do
    echo "include ${rcfile}" >>~/.nanorc
  done
}

sizes-files() {
  gdu --human-readable --max-depth=1 --all | gsort --human-numeric-sort --reverse
}
export -f sizes-files
sizes-disks() {
  gdf --human-readable --print-type --exclude-type=tmpfs --exclude-type=squashfs --exclude-type=devtmpfs
}
export -f sizes-disks

export EDITOR="${HOMEBREW_PREFIX}/bin/vim"

# brew list installed package content
# brew ls --verbose <name/s>

cleanup-finder-shit() {
  find . -type f -name '*.DS_Store' -ls -delete
}
