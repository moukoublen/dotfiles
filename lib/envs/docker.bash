alias docker-clean-volumes='docker volume rm $(docker volume ls -qf dangling=true)'

docker-stop-all() {
  for i in $(docker ps --format "{{.Names}}"); do
    printf "Stoping %s ... " "$i"
    docker stop $i > /dev/null
    if [ $? -eq 0 ]; then
      printf "\e[1;32mDone!\e[m\n" "$i"
    else
      printf "\e[1;31mFailed!\e[m\n" "$i"
    fi
  done
}

docker-clean-all() {( set -ex
  # --force           Do not prompt for confirmation
  docker system prune --force
  docker image prune --force
  docker network prune --force
  docker volume prune --force
)}

if command -v drh 1>/dev/null 2>&1; then
  source <(drh --completion)
fi

install-docker-compose-completion() {
  local DVER=${1:-master}
  mkdir -p ~/.dotfiles-extras
  curl -L "https://raw.githubusercontent.com/docker/compose/${DVER}/contrib/completion/bash/docker-compose" > "${HOME}/.dotfiles-extras/docker-compose.bash-completion"
}

################################################################################
################# macos docker #################################################
source-docker-bash-completion() {
  etc=/Applications/Docker.app/Contents/Resources/etc
  if [[ -f ${etc}/docker-compose.bash-completion ]]; then
    source ${etc}/docker-compose.bash-completion
  fi
  if [[ -f ${etc}/docker.bash-completion ]]; then
    source ${etc}/docker.bash-completion
  fi
}
export -f source-docker-bash-completion
################################################################################
################################################################################
