docker-clean-dangling-volumes() {
  docker volume rm $(docker volume ls -qf dangling=true)
}

docker-stop-all() {
  for i in $(docker ps --format "{{.Names}}"); do
    printf "Stoping %s ... " "${i}"
    docker stop "${i}" >/dev/null
    if [[ $? -eq 0 ]]; then
      printf "\e[1;32mDone!\e[m\n"
    else
      printf "\e[1;31mFailed!\e[m\n"
    fi
  done
}

docker-clean-all() { (
  set -x
  # --force           Do not prompt for confirmation
  docker system prune --force
  docker image prune --force
  docker network prune --force
  docker volume prune --force
); }

################# macos docker
# /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion
# /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion
