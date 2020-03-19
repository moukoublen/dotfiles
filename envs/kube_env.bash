if command -v kubectl 1>/dev/null 2>&1; then
  source <(kubectl completion bash)
fi

if command -v minikube 1>/dev/null 2>&1; then
  source <(minikube completion bash)
fi
