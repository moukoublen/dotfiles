if [ -d /usr/local/go ]
then
  # No need of GOROOT in case of default path (/usr/local/go)
  #export GOROOT=/path/to/special/go
  add_to_start_of_path_if_not_exists /usr/local/go/bin
  export GOPATH=$HOME/goworkspace
  alias set_gopath_bin_to_path='export PATH=$PATH:$GOPATH/bin'
fi

################################################################################
# Marmalade Env Management
################################################################################
_marmalade_get_latest_version_number__go() {
  go version | sed 's/go version//' | sed 's/go//' | sed 's/ linux\/amd64//'
}

_marmalade_get_local_latest_version_number__go() {
  go version | sed 's/go version//' | sed 's/go//' | sed 's/ linux\/amd64//'
}

_marmalade_install__go() {
  # $1: version e.g. 1.9
  # https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz
  curl -L https://storage.googleapis.com/golang/go$1.linux-amd64.tar.gz > /tmp/go$1.linux-amd64.tar.gz
  if [ -d /usr/local/go ]; then sudo rm -rf /usr/local/go; fi
  sudo tar -C /usr/local -xzf /tmp/go$1.linux-amd64.tar.gz
  rm /tmp/go$1.linux-amd64.tar.gz
}
