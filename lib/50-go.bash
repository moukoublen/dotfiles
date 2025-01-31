# GOEXPERIMENT=loopvar

if [ -d /usr/local/go ]; then
  # No need of GOROOT in case of default path (/usr/local/go)
  #export GOROOT=/path/to/special/go
  path-add /usr/local/go/bin
fi

if command -v go 1>/dev/null 2>&1; then
  # set gopath away from home
  if [[ -d /xyz/go ]]; then
    export GOPATH="/xyz/go"
  else
    export GOPATH="${HOME}/goworkspace"
  fi

  path-add "$(go env GOPATH)/bin"
fi

if command -v golangci-lint 1>/dev/null 2>&1; then
  # https://www.shellcheck.net/wiki/SC1090
  # shellcheck source=/dev/null
  source <(golangci-lint completion bash)
fi

go-test() {
  rm -rf /tmp/golang.coverage.txt || true
  # -p=1 -v
  CGO_ENABLED=1 go test -timeout=60s -race -coverprofile=/tmp/golang.coverage.txt -covermode=atomic "${@}" ./...
  go tool cover -func /tmp/golang.coverage.txt
  rm -rf /tmp/golang.coverage.txt || true
}

## go build -trimpath -ldflags '-s -w' "${@}"

go-install() {
  echo -e "> go install \e[0;35m${*}\e[0m"
  #go install -a -trimpath -ldflags '-s -w' "${@}"
  #go install -trimpath -ldflags '-s -w' "${@}"
  go install "${@}"
}

go-update-all-mods() {
  # https://go.dev/ref/mod#go-get
  # -u flag tells go get to upgrade modules
  # -t flag tells go get to consider modules needed to build tests of packages named on the command line.
  # When -t and -u are used together, go get will update test dependencies as well.
  go get -u -t ./...
  go mod tidy
}

install-go-tools() { (
  export CGO_ENABLED=0

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
  # go vet -vettool=$(which shadow) ./...

  go-install "golang.org/x/vuln/cmd/govulncheck@latest"

  # https://github.com/dominikh/go-tools/releases (https://staticcheck.io/)
  HONNEF_VER=latest
  go-install "honnef.co/go/tools/cmd/staticcheck@${HONNEF_VER}"
  go-install "honnef.co/go/tools/cmd/structlayout@${HONNEF_VER}"
  go-install "honnef.co/go/tools/cmd/structlayout-pretty@${HONNEF_VER}"
  go-install "honnef.co/go/tools/cmd/structlayout-optimize@${HONNEF_VER}"

  # https://github.com/golangci/golangci-lint/releases
  #go-install 'github.com/golangci/golangci-lint/cmd/golangci-lint@latest'
  curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b "$(go env GOPATH)/bin"

  # https://github.com/securego/gosec/releases
  go-install 'github.com/securego/gosec/v2/cmd/gosec@latest'

  # https://github.com/mvdan/gofumpt/releases
  go-install 'mvdan.cc/gofumpt@latest'

  # https://github.com/daixiang0/gci/releases
  go-install 'github.com/daixiang0/gci@latest'

  # https://github.com/mgechev/revive/releases
  go-install 'github.com/mgechev/revive@latest'

  ################################################################
  ################################################################

  # https://github.com/mozilla/sops/releases
  go-install 'github.com/getsops/sops/v3/cmd/sops@latest'

  # https://github.com/orijtech/structslop/tags
  go-install 'github.com/orijtech/structslop/cmd/structslop@latest'

  # https://github.com/jesseduffield/lazydocker/releases
  #go-install github.com/jesseduffield/lazydocker@latest

  go-install github.com/google/gops@latest

  #go-install github.com/elastic/elastic-package@latest
  #go-install github.com/cashapp/hermit/cmd/hermit@latest
); }

# Where is the go ENV file?
# Linux you'll get $HOME/. config/go/env
# macOS you'll get $HOME/Library/Application Support/go/env

install-hugo() {
  # https://github.com/gohugoio/hugo?tab=readme-ov-file#build-from-source
  CGO_ENABLED=1 go install -tags extended -trimpath -ldflags '-s -w' github.com/gohugoio/hugo@latest
}
