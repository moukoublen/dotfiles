alias container_mongo_run="docker run -p 27017:27017 --name mongo-playground -d mongo"
alias container_mongo_run_with_auth="docker run -p 27017:27017 --name mongo-playground -d mongo --auth"
alias container_mongo_stop='docker stop mongo-playground'
alias container_mongo_start='docker start mongo-playground'

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
  curl -L https://github.com/docker/compose/releases/download/$1/docker-compose-Linux-x86_64 > $MARMALADE_ENVS/compose/$1/docker-compose
  chmod +x $MARMALADE_ENVS/compose/$1/docker-compose
}
