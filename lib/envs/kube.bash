
install-kubectl() {(
  local VER
  VER="${1}"  # first argument is the version number e.g. 1.19
  if [ -z "${VER}" ]; then
    VER=$(curl -L -s https://dl.k8s.io/release/stable.txt)
  fi

  if [[ "${VER}" != v* ]]; then
    VER="v${VER}"
  fi

  set -e

  rm -rf /tmp/kubectl_install || true
  mkdir -p /tmp/kubectl_install

  curl --fail --show-error --location "https://dl.k8s.io/release/${VER}/bin/linux/amd64/kubectl" --output /tmp/kubectl_install/kubectl
  sudo install -o root -g root -m 0755 /tmp/kubectl_install/kubectl /usr/local/bin/kubectl

  rm -rf /tmp/kubectl_install || true
)}

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
