export NODE_HOME=$MARMALADE_ENVS/node/default
add_to_end_of_path_if_not_exists $NODE_HOME/bin
#if which npm > /dev/null 2>&1; then source <(npm completion); fi

################################################################################
# Marmalade Env Management
#
#
################################################################################
_marmalade_get_latest_version_number__node() {
  curl -s https://nodejs.org/dist/index.json | jq -r '.[0].version' | cut -c 2- # v8.6.0 -> 8.6.0
}

_marmalade_get_local_latest_version_number__node() {
  ls -1 $MARMALADE_ENVS/node/ | grep -v default | sort -V | tail -n 1
}

_marmalade_install__node() {
  # $1: version e.g. 8.6.0
  curl -L https://nodejs.org/dist/v$1/node-v$1-linux-x64.tar.xz > /tmp/node.tar.xz
  mkdir -p $MARMALADE_ENVS/node/$1
  tar xf /tmp/node.tar.xz --strip-components=1 -C $MARMALADE_ENVS/node/$1
  rm /tmp/node.tar.xz
}
