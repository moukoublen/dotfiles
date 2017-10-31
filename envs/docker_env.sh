container_mongo() {
  # https://hub.docker.com/_/mongo/
  docker run --name mongo-testbed \
             -p 27017:27017 \
             -d mongo
}

container_mongo_with_auth() {
  # https://hub.docker.com/_/mongo/
  docker run --name mongo-testbed \
             -p 27017:27017 \
             -d mongo --auth
  # $ docker exec -it mongo-playground mongo admin
  # > db.createUser({ user: 'jsmith', pwd: 'some-initial-password', roles: [ { role: "userAdminAnyDatabase", db: "admin" } ] });
}

container_postgres() {
  # https://hub.docker.com/_/postgres/
  docker run --name postgres-testbed \
             -p 5432:5432 \
             -e POSTGRES_PASSWORD=secure \
             -d postgres:10
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
  curl -L https://github.com/docker/compose/releases/download/$1/docker-compose-Linux-x86_64 > $MARMALADE_ENVS/compose/$1/docker-compose
  chmod +x $MARMALADE_ENVS/compose/$1/docker-compose
}
