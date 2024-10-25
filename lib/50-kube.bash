install-kubectl() {
  "${DOTFILES_PATH}/scripts/install-kubectl" "${@}"
}

if [[ -x /usr/local/bin/kubectl ]]; then
  # https://www.shellcheck.net/wiki/SC1090
  # shellcheck source=/dev/null
  source <(kubectl completion bash)
  alias k=kubectl
  complete -F __start_kubectl k
fi
