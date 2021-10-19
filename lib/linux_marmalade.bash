################################################################################
######### Paths ################################################################
add_to_path $HOME/.local/bin
add_to_path $HOME/bin
################################################################################
################################################################################

################################################################################
######### Aliases ##############################################################
alias O='xdg-open'
alias ll='command ls -la --color=auto'
alias tree='command tree -C'
alias go-to-runlevel-3='sudo systemctl set-default multi-user.target'
alias go-to-runlevel-5='sudo systemctl set-default graphical.target'
alias get-wm-class='xprop WM_CLASS'
alias p='ps -Aww -o user,pid,ppid,%cpu,%mem,vsz,rss,tty,stat,start_time,command --sort=-user,-ppid,-pid'
alias PGREP='p | grep'
################################################################################
################################################################################

__wcat() {
  if [[ "$(type -t ${1})" == 'function' ]]; then
    declare -f "${1}"
    return
  fi
  if [[ "$(type -t ${1})" == 'alias' ]]; then
    alias "${1}"
    return
  fi
  local fl=$(which $1)

  echo -e "\e[0;90m============================================================\e[0m"
  echo -e "\e[0;37mfile:\e[0m \e[0;36m${fl}\e[0m"
  echo -e "\e[0;90m============================================================\e[0m"
  cat "${fl}"
  echo -e "\e[0;90m============================================================\e[0m"
}

wcat() {
  local cat_cmd
  cat_cmd=$(which bat)
  if [[ "${cat_cmd}" == "" ]]; then
    __wcat "${1}"
    return
  fi

  cat_cmd="${cat_cmd} --paging=never --style=plain,header --wrap=never --theme=Nord"

  if [[ "$(type -t ${1})" == 'function' ]]; then
    declare -f "${1}" | ${cat_cmd} --language=bash --file-name="${1}"
    return
  fi
  if [[ "$(type -t ${1})" == 'alias' ]]; then
    alias "${1}" | ${cat_cmd} --language=bash --file-name="${1}"
    return
  fi

  ${cat_cmd} "$(which $1)"
}
complete -c wcat

alias dnf-display-package-contents='dnf repoquery -l'
alias dnf-display-local-package-contents='dnf repoquery --installed -l'

[[ -e $HOME/.dir_colors ]] && eval $(dircolors ~/.dir_colors)

bind 'set mark-symlinked-directories on'

################################################################################
######### Marmalade Envs #######################################################
export MARMALADE_ENVS=$HOME/.marmalade.envs

for i in $MARMALADE_PATH/lib/envs/*.bash ; do
  if [ -r "$i" ]; then
    source "$i"
  fi
done
################################################################################
################################################################################

export EDITOR=/usr/bin/vim
