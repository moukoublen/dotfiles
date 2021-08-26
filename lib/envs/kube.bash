if command -v kubectl 1>/dev/null 2>&1; then
  source <(kubectl completion bash)
  alias k=kubectl
  complete -F __start_kubectl k
fi

if command -v helm 1>/dev/null 2>&1; then
  source <(helm completion bash)
fi

if command -v minikube 1>/dev/null 2>&1; then
  source <(minikube completion bash)
fi
