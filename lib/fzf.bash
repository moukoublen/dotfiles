# https://github.com/junegunn/fzf
# https://github.com/sharkdp/fd

# sudo dnf install fzf fd-find

if [[ $(uname) = "Linux" ]]; then
  if [ -f /usr/share/fzf/shell/key-bindings.bash ]; then
    source /usr/share/fzf/shell/key-bindings.bash
  fi
fi
