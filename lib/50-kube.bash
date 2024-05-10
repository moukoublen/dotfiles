
install-kubectl() {(
  ${DOTFILES_PATH}/scripts/install-kubectl "$@"
)}

if [[ -x /usr/local/bin/kubectl ]]; then
  source <(kubectl completion bash)
  alias k=kubectl
  complete -F __start_kubectl k
fi
