# marmalade [update, install] <env>

marmalade() {
  # $1: command
  # $2: env
  if [[ $1 == "update" ]]; then
    if [[ "$2" == "" ]]; then
      for env_name in atom gradle kotlin maven node sbt scala
      do
        _marmalade_update $env_name
      done
    else
      _marmalade_update $2
    fi
  elif [[ $1 == "install" ]]; then
    _marmalade_install $2 $3
  fi
}

_marmalade_install() {
  # $1: env
  # $2: version
  local cmd_install="_marmalade_install__$1"
  eval $cmd_install $2
}

_marmalade_update() {
  # $1: env
  # $2: 1|0 (optional) = Install only. DO NOT Make default
  local cmd_get_latest_ver="_marmalade_get_latest_version_number__$1"
  local cmd_get_local_ver="_marmalade_get_local_latest_version_number__$1"
  local latest_ver=$(eval $cmd_get_latest_ver)
  local local_ver=$(eval $cmd_get_local_ver)
  if [[ "$latest_ver" == "" ]]; then
    echo "  > ERROR during version check for $1"
    return
  fi
  if [ "$local_ver" != "$latest_ver" ]; then
    echo "  > Updating $1 from $local_ver to $latest_ver"
    eval "_marmalade_install__$1" $latest_ver
    if [ "$2" != "1" ]; then
      _marmalade_make_default $1 $latest_ver
    fi
  else
    echo "  > Env $1 is already updated. Latest version $latest_ver"
  fi
}

_marmalade_make_default() {
  if [[ -d $MARMALADE_ENVS/$1/default ]]; then
    unlink $MARMALADE_ENVS/$1/default
  fi
  if [[ -d $MARMALADE_ENVS/$1 ]]; then
    (cd $MARMALADE_ENVS/$1/; ln -s $2 default)
  fi
}
