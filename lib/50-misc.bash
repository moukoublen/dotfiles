if command -v zoxide &>/dev/null; then
  # https://www.shellcheck.net/wiki/SC1090
  # shellcheck source=/dev/null
  source <(zoxide init bash)
fi

## fzf                                          ##
# https://github.com/junegunn/fzf
# https://github.com/sharkdp/fd
if command -v fzf &>/dev/null; then
  # https://www.shellcheck.net/wiki/SC1090
  # shellcheck source=/dev/null
  . <(fzf --bash)
fi

alias gcl='git config --local --list'
