
install-kubectl() {(
  ${DOTFILES_PATH}/scripts/install-kubectl "$@"
)}

if [[ -x /usr/local/bin/kubectl ]]; then
  source <(kubectl completion bash)
  alias k=kubectl
  complete -F __start_kubectl k
fi

#if command -v minikube 1>/dev/null 2>&1; then
if [[ -x /usr/local/bin/minikube ]]; then
  source <(minikube completion bash)
fi

if [[ -x /usr/local/bin/helm ]]; then
  source <(helm completion bash)
fi

if [[ -x /usr/local/bin/kind ]]; then
  source <(kind completion bash)
fi

if [[ -x /usr/local/bin/k9s ]]; then
  source <(k9s completion bash)
fi
