if [ -d /usr/local/go ]; then
  # No need of GOROOT in case of default path (/usr/local/go)
  #export GOROOT=/path/to/special/go
  add_to_path /usr/local/go/bin
  export GOPATH="${HOME}/goworkspace"
  add_to_path "$(go env GOPATH)/bin"
fi

go-install() {
  go install -a -ldflags '-s -w -extldflags "-static"' "$@"
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

  __go_install() {
    echo -e "> Installing \e[0;90m$@\e[0m"
    go install -a -ldflags '-s -w -extldflags "-static"' "$@"
  }

  # https://pkg.go.dev/golang.org/x/tools?tab=versions
  GO_X_TOOLS_VER=v0.3.0
  __go_install "golang.org/x/tools/cmd/goimports@${GO_X_TOOLS_VER}"
  __go_install "golang.org/x/tools/go/analysis/passes/fieldalignment/cmd/fieldalignment@${GO_X_TOOLS_VER}"
  __go_install "golang.org/x/tools/go/analysis/passes/shadow/cmd/shadow@${GO_X_TOOLS_VER}"
  #__install_binary "${GOPATH}"/bin/{goimports,fieldalignment,shadow}

  # https://github.com/dominikh/go-tools/releases (https://staticcheck.io/)
  HONNEF_VER=v0.3.3
  __go_install "honnef.co/go/tools/cmd/staticcheck@${HONNEF_VER}"
  __go_install "honnef.co/go/tools/cmd/structlayout@${HONNEF_VER}"
  __go_install "honnef.co/go/tools/cmd/structlayout-pretty@${HONNEF_VER}"
  __go_install "honnef.co/go/tools/cmd/structlayout-optimize@${HONNEF_VER}"
  #__install_binary "${GOPATH}"/bin/{staticcheck,structlayout,structlayout-pretty,structlayout-optimize}

  # https://github.com/golangci/golangci-lint/releases
  __go_install 'github.com/golangci/golangci-lint/cmd/golangci-lint@v1.50.1'
  #__install_binary "${GOPATH}"/bin/golangci-lint

  # https://github.com/securego/gosec/releases
  __go_install 'github.com/securego/gosec/v2/cmd/gosec@v2.14.0'
  #__install_binary "${GOPATH}"/bin/gosec

  # https://github.com/mvdan/gofumpt/releases
  __go_install 'mvdan.cc/gofumpt@v0.4.0'
  #__install_binary "${GOPATH}"/bin/gofumpt

  # https://github.com/mgechev/revive/releases
  __go_install 'github.com/mgechev/revive@v1.2.4'
  #__install_binary "${GOPATH}"/bin/revive

  ################################################################
  ################################################################

  # https://github.com/mozilla/sops/releases
  __go_install 'go.mozilla.org/sops/v3/cmd/sops@v3.7.3'
  #__install_binary "${GOPATH}"/bin/sops

  # https://github.com/orijtech/structslop/tags
  __go_install 'github.com/orijtech/structslop/cmd/structslop@v0.0.7'
  #__install_binary "${GOPATH}"/bin/structslop
)}