if command -v zoxide &>/dev/null; then
  # https://www.shellcheck.net/wiki/SC1090
  # shellcheck source=/dev/null
  . <(zoxide init bash)
fi

# https://github.com/junegunn/fzf
# https://github.com/sharkdp/fd
if command -v fzf &>/dev/null; then
  # https://www.shellcheck.net/wiki/SC1090
  # shellcheck source=/dev/null
  . <(fzf --bash)
fi

if command -v starship &>/dev/null; then
  alias k=kubectl
fi

alias gcl='git config --local --list'
