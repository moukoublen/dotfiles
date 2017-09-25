alias container_mongo_run="docker run -p 27017:27017 --name mongo-playground -d mongo"
alias container_mongo_run_with_auth="docker run -p 27017:27017 --name mongo-playground -d mongo --auth"
alias container_mongo_stop='docker stop mongo-playground'
alias container_mongo_start='docker start mongo-playground'

get_docker_compose() {
  sudo sh -c "curl -L https://github.com/docker/compose/releases/download/$1/docker-compose-Linux-x86_64 > /opt/docker-compose/docker-compose-$1"
  sudo chmod +x /opt/docker-compose/docker-compose-$1
}
