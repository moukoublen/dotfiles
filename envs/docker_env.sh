alias dps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}"'
alias dpsp='docker ps --format "{{.ID}}\t{{.Names}}\n\t\t{{.Ports}}\n"'
alias docker-stop-all='docker stop $(docker ps -q)'


__dhelp_completion() {
  cur=$2
  __docker_complete_containers_running
}

dexec() {
  docker exec -it $1 $2
}
complete -F __dhelp_completion dexec

dshell() {
  dexec $1 sh
}
complete -F __dhelp_completion dshell


container_swagger_editor() {
  # https://hub.docker.com/r/swaggerapi/swagger-editor/
  docker run --name swagger-editor \
             -p 6060:8080 \
             -d swaggerapi/swagger-editor
}


get_docker_compose() {
  sudo sh -c "curl -L https://github.com/docker/compose/releases/download/$1/docker-compose-Linux-x86_64 > /opt/docker-compose/docker-compose-$1"
  sudo chmod +x /opt/docker-compose/docker-compose-$1
}


_marmalade_get_latest_version_number__compose() {
  curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.name'
}

_marmalade_get_local_latest_version_number__compose() {
  ls -1 $MARMALADE_ENVS/compose/ | grep -v default | sort -V | tail -n 1
}

_marmalade_install__compose() {
  # $1: version e.g. 1.16.1
  # https://github.com/docker/compose/releases/download/1.16.1/docker-compose-Linux-x86_64
  mkdir -p $MARMALADE_ENVS/compose/$1
  curl -L --fail https://github.com/docker/compose/releases/download/$1/docker-compose-Linux-x86_64 > $MARMALADE_ENVS/compose/$1/docker-compose
  chmod +x $MARMALADE_ENVS/compose/$1/docker-compose
}




_marmalade_get_latest_version_number__docker-machine() {
  curl -s https://api.github.com/repos/docker/machine/releases/latest | jq -r '.name'
}

_marmalade_get_local_latest_version_number__docker-machine() {
  ls -1 $MARMALADE_ENVS/docker-machine/ | grep -v default | sort -V | tail -n 1
}

_marmalade_install__docker-machine() {
  # $1: version e.g. 1.16.1
  # https://github.com/docker/compose/releases/download/1.16.1/docker-compose-Linux-x86_64
  mkdir -p $MARMALADE_ENVS/docker-machine/$1
  curl -L --fail https://github.com/docker/machine/releases/download/$1/docker-machine-$(uname -s)-$(uname -m) > $MARMALADE_ENVS/docker-machine/$1/docker-machine
  chmod +x $MARMALADE_ENVS/docker-machine/$1/docker-machine
}
