
install-kubectl() {(
  ${DOTFILES_PATH}/scripts/install-kubectl "$@"
)}

if command -v kubectl 1>/dev/null 2>&1; then
  source <(kubectl completion bash)
  alias k=kubectl
  complete -F __start_kubectl k
fi

if command -v minikube 1>/dev/null 2>&1; then
  source <(minikube completion bash)
fi

if [[ $(uname) = "Linux" ]]; then
  if command -v helm 1>/dev/null 2>&1; then
    source <(helm completion bash)
  fi

  if command -v kind 1>/dev/null 2>&1; then
    source <(kind completion bash)
  fi
fi

if command -v k9s 1>/dev/null 2>&1; then
  source <(k9s completion bash)
fi
