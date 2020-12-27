export SCALA_HOME=$MARMALADE_ENVS/scala/default
add_to_path $SCALA_HOME/bin "after"

################################################################################
# Marmalade Env Management
################################################################################
_marmalade_get_latest_version_number__scala() {
  curl -s https://api.github.com/repos/scala/scala/releases/latest | jq -r '.tag_name' | cut -c 2- # v8.6.0 -> 8.6.0
}

_marmalade_get_local_latest_version_number__scala() {
  ls -1 $MARMALADE_ENVS/scala/ | grep -v default | sort -V | tail -n 1
}

_marmalade_install__scala() {
  # $1: version e.g. 4.1
  curl -L --fail https://downloads.lightbend.com/scala/$1/scala-$1.tgz > /tmp/scala.tgz
  mkdir -p $MARMALADE_ENVS/scala/$1
  tar xf /tmp/scala.tgz --strip-components=1 -C $MARMALADE_ENVS/scala/$1
  rm /tmp/scala.tgz
}
