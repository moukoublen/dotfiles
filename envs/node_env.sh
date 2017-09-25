export NODE_HOME=$MARMALADE_ENVS/node/default
add_to_end_of_path_if_not_exists $NODE_HOME/bin
#if which npm > /dev/null 2>&1; then source <(npm completion); fi
get_node() {
  #$1 : node version e.g.  "8.4.0"
  curl -L https://nodejs.org/dist/v$1/node-v$1-linux-x64.tar.xz > /tmp/node.tar.xz
  tar xf /tmp/node.tar.xz -C $MARMALADE_ENVS/node/
}
