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

install-mise-tools() {
  mise use --global \
    fzf@latest \
    fd@latest \
    shfmt@latest \
    shellcheck@latest \
    golangci-lint@latest \
    starship@latest \
    delta@latest \
    helm@latest \
    k9s@latest \
    kind@latest \
    minikube@latest \
    aws-cli@latest \
    vfox:gcloud@latest
}

# https://mise.jdx.dev/registry.html

# https://github.com/aws/aws-cli/commits/v2/

# https://mise.jdx.dev/lang/go.html#go
