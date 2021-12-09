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

docker-clean-all() {
  # --force           Do not prompt for confirmation
  docker system prune --force
  docker network prune --force
  docker volume prune --force
}

dps() {
  docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}" "$@"
}
dpsp() {
  docker ps --format "{{.ID}}\t{{.Names}}\n\t\t{{.Ports}}\n" "$@"
}
complete -F __dps_completion dps dpsp
complete -F __drh_completion drh

install-docker-compose-completion() {
  local DVER=${1:-master}
  mkdir -p ~/.dotfiles-extras
  curl -L "https://raw.githubusercontent.com/docker/compose/${DVER}/contrib/completion/bash/docker-compose" > "${HOME}/.dotfiles-extras/docker-compose.bash-completion"
}

__dps_completion() {
  [[ "$(type -t _docker_container_run)" != "function" ]] && \
    [[ -f /usr/share/bash-completion/completions/docker ]] && \
    source /usr/share/bash-completion/completions/docker

  local cur prev words cword
  _get_comp_words_by_ref -n : cur prev words cword
  _docker_ps
}

__drh_completion() {
  [[ "$(type -t _docker_container_run)" != "function" ]] && \
    [[ -f /usr/share/bash-completion/completions/docker ]] && \
    source /usr/share/bash-completion/completions/docker

  local cur prev words cword
  _get_comp_words_by_ref -n : cur prev words cword
  _docker_container_run
}


################################################################################
################# macos docker #################################################
if [[ -f /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion ]]; then
  source /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion
fi

if [[ -f /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion ]]; then
  source /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion
fi

if [[ -f /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion ]]; then
  source /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion
fi
################################################################################
################################################################################


################################################################################
################# marmalade functions ##########################################
_marmalade_get_latest_version_number__docker-machine() {
  curl -s https://api.github.com/repos/docker/machine/releases/latest | jq -r '.name'
}

_marmalade_get_local_latest_version_number__docker-machine() {
  ls -1 $DOTFILES_ENVS/docker-machine/ | grep -v default | sort -V | tail -n 1
}

_marmalade_install__docker-machine() {
  # $1: version e.g. 1.16.1
  # https://github.com/docker/machine/releases/download/1.16.1/docker-compose-Linux-x86_64
  mkdir -p $DOTFILES_ENVS/docker-machine/$1
  curl -L --fail https://github.com/docker/machine/releases/download/$1/docker-machine-$(uname -s)-$(uname -m) > $DOTFILES_ENVS/docker-machine/$1/docker-machine
  chmod +x $DOTFILES_ENVS/docker-machine/$1/docker-machine
}
################################################################################
################################################################################
