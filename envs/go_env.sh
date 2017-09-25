if [ -d /usr/local/go ]
then
  # No need of GOROOT in case of default path (/usr/local/go)
  #export GOROOT=/path/to/special/go
  add_to_start_of_path_if_not_exists /usr/local/go/bin
  export GOPATH=$HOME/goworkspace
  alias set_gopath_bin_to_path='export PATH=$PATH:$GOPATH/bin'
fi

