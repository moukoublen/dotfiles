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
