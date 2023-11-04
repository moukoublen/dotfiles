if [ -d /usr/local/go ]; then
  # No need of GOROOT in case of default path (/usr/local/go)
  #export GOROOT=/path/to/special/go
  add_to_path /usr/local/go/bin
fi

if command -v go 1>/dev/null 2>&1; then
  # set gopath away from home
  if [ -d /goose/goworkspace ]; then
    export GOPATH="/goose/goworkspace"
  else
    export GOPATH="${HOME}/goworkspace"
  fi

  add_to_path "$(go env GOPATH)/bin"
fi

if command -v golangci-lint 1>/dev/null 2>&1; then
  source <(golangci-lint completion bash)
fi


go-install() {
  echo -e "> Installing \e[0;90m$@\e[0m"
  (
    set -x
    #go install -a -trimpath -ldflags '-s -w' "$@"
    go install -trimpath -ldflags '-s -w' "$@"
  )
}


install-go-tools() {(
  export CGO_ENABLED=0
  #__install_binary() {
  #  for v in "$@"; do
  #    echo -e "    moving \e[0;90m${v}\e[0m -> \e[0;32m/usr/local/bin\e[0m"
  #  done
  #  sudo install --mode=755 --group=root --owner=root --target-directory=/usr/local/bin/ "$@"
  #  rm -rf "$@"
  #}

  # https://github.com/go-delve/delve/releases
  go-install github.com/go-delve/delve/cmd/dlv@latest

  # https://pkg.go.dev/golang.org/x/tools?tab=versions
  GO_X_TOOLS_VER=latest
  go-install "golang.org/x/tools/cmd/gonew@${GO_X_TOOLS_VER}"
  go-install "golang.org/x/tools/cmd/callgraph@${GO_X_TOOLS_VER}"
  go-install "golang.org/x/tools/cmd/digraph@${GO_X_TOOLS_VER}"
  go-install "golang.org/x/tools/cmd/fiximports@${GO_X_TOOLS_VER}"
  go-install "golang.org/x/tools/cmd/goimports@${GO_X_TOOLS_VER}"
  go-install "golang.org/x/tools/cmd/gorename@${GO_X_TOOLS_VER}"
  go-install "golang.org/x/tools/go/analysis/passes/defers/cmd/defers@${GO_X_TOOLS_VER}"
  go-install "golang.org/x/tools/go/analysis/passes/fieldalignment/cmd/fieldalignment@${GO_X_TOOLS_VER}"
  go-install "golang.org/x/tools/go/analysis/passes/findcall/cmd/findcall@${GO_X_TOOLS_VER}"
  go-install "golang.org/x/tools/go/analysis/passes/ifaceassert/cmd/ifaceassert@${GO_X_TOOLS_VER}"
  go-install "golang.org/x/tools/go/analysis/passes/lostcancel/cmd/lostcancel@${GO_X_TOOLS_VER}"
  go-install "golang.org/x/tools/go/analysis/passes/nilness/cmd/nilness@${GO_X_TOOLS_VER}"
  go-install "golang.org/x/tools/go/analysis/passes/ifaceassert/cmd/ifaceassert@${GO_X_TOOLS_VER}"
  go-install "golang.org/x/tools/go/analysis/passes/shadow/cmd/shadow@${GO_X_TOOLS_VER}"
  go-install "golang.org/x/tools/go/analysis/passes/stringintconv/cmd/stringintconv@${GO_X_TOOLS_VER}"
  go-install "golang.org/x/tools/go/analysis/passes/unmarshal/cmd/unmarshal@${GO_X_TOOLS_VER}"
  go-install "golang.org/x/tools/go/analysis/passes/unusedresult/cmd/unusedresult@${GO_X_TOOLS_VER}"
  #__install_binary "${GOPATH}"/bin/{goimports,fieldalignment,shadow}
  # go vet -vettool=$(which shadow) ./...

  go-install "golang.org/x/vuln/cmd/govulncheck@latest"


  # https://github.com/dominikh/go-tools/releases (https://staticcheck.io/)
  HONNEF_VER=latest
  go-install "honnef.co/go/tools/cmd/staticcheck@${HONNEF_VER}"
  go-install "honnef.co/go/tools/cmd/structlayout@${HONNEF_VER}"
  go-install "honnef.co/go/tools/cmd/structlayout-pretty@${HONNEF_VER}"
  go-install "honnef.co/go/tools/cmd/structlayout-optimize@${HONNEF_VER}"
  #__install_binary "${GOPATH}"/bin/{staticcheck,structlayout,structlayout-pretty,structlayout-optimize}

  # https://github.com/golangci/golangci-lint/releases
  go-install 'github.com/golangci/golangci-lint/cmd/golangci-lint@latest'
  #__install_binary "${GOPATH}"/bin/golangci-lint

  # https://github.com/securego/gosec/releases
  go-install 'github.com/securego/gosec/v2/cmd/gosec@latest'
  #__install_binary "${GOPATH}"/bin/gosec

  # https://github.com/mvdan/gofumpt/releases
  go-install 'mvdan.cc/gofumpt@latest'
  #__install_binary "${GOPATH}"/bin/gofumpt

  # https://github.com/mgechev/revive/releases
  go-install 'github.com/mgechev/revive@latest'
  #__install_binary "${GOPATH}"/bin/revive

  ################################################################
  ################################################################

  # https://github.com/mozilla/sops/releases
  go-install 'github.com/getsops/sops/v3/cmd/sops@latest'
  #__install_binary "${GOPATH}"/bin/sops

  # https://github.com/orijtech/structslop/tags
  go-install 'github.com/orijtech/structslop/cmd/structslop@latest'
  #__install_binary "${GOPATH}"/bin/structslop

  # https://github.com/jesseduffield/lazydocker/releases
  #go-install github.com/jesseduffield/lazydocker@latest

  # https://github.com/jesseduffield/lazygit/releases
  #go-install github.com/jesseduffield/lazygit@latest

  # # https://github.com/gohugoio/hugo/releases
  # go-install -tags extended github.com/gohugoio/hugo@latest

  go-install github.com/google/gops@latest

  #go-install github.com/elastic/elastic-package@latest
  #go-install github.com/cashapp/hermit/cmd/hermit@latest
)}

# Where is the go ENV file?
# Linux you'll get $HOME/. config/go/env
# macOS you'll get $HOME/Library/Application Support/go/env
#
