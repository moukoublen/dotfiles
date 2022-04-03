export NODE_HOME=$DOTFILES_ENVS/node/default
add_to_path $NODE_HOME/bin "after"
#if which npm > /dev/null 2>&1; then source <(npm completion); fi

################################################################################
# Marmalade Env Management
#
#
################################################################################
_marmalade_get_latest_version_number__node() {
  curl -s https://nodejs.org/dist/index.json | jq -r 'map( select( .lts != false ) )[0].version' | cut -c 2- # v8.6.0 -> 8.6.0
}

_marmalade_get_local_latest_version_number__node() {
  ls -1 $DOTFILES_ENVS/node/ | grep -v default | sort -V | tail -n 1
}

_marmalade_install__node() {
  # $1: version e.g. 8.6.0
  curl -L --fail https://nodejs.org/dist/v$1/node-v$1-linux-x64.tar.xz > /tmp/node.tar.xz
  mkdir -p $DOTFILES_ENVS/node/$1
  tar xf /tmp/node.tar.xz --strip-components=1 -C $DOTFILES_ENVS/node/$1
  rm /tmp/node.tar.xz
}
