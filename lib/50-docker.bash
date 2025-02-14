alias docker-clean-volumes='docker volume rm $(docker volume ls -qf dangling=true)'

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

################################################################################
################# macos docker #################################################
source-docker-bash-completion() {
  local etc='/Applications/Docker.app/Contents/Resources/etc'
  if [[ -f "${etc}/docker.bash-completion" ]]; then
    # https://www.shellcheck.net/wiki/SC1090
    # shellcheck source=/dev/null
    source "${etc}/docker.bash-completion"
  fi
  if [[ -f ${etc}/docker-compose.bash-completion ]]; then
    # https://www.shellcheck.net/wiki/SC1090
    # shellcheck source=/dev/null
    source "${etc}/docker-compose.bash-completion"
  fi
}
export -f source-docker-bash-completion
source-docker-bash-completion
################################################################################
################################################################################

if command -v dr 1>/dev/null 2>&1; then
  # https://www.shellcheck.net/wiki/SC1090
  # shellcheck source=/dev/null
  source <(dr --completion)
fi
