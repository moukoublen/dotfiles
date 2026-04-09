if ! command -v mise &>/dev/null; then
  return 0
fi

# https://mise.jdx.dev/getting-started.html#activate-mise
eval "$(mise activate bash)"

# https://mise.jdx.dev/installing-mise.html#autocompletion
# mise use -g usage
# mise completion bash > ~/.local/share/bash-completion/completions/mise

# https://mise.jdx.dev/configuration.html

# mise upgrade --bump

# mise list --global
