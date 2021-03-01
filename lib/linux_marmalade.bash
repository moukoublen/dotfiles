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
################################################################################
################################################################################

wcat() {
  if [[ "$(type -t ${1})" == 'function' ]]; then
    declare -f "${1}"
    return
  fi
  if [[ "$(type -t ${1})" == 'alias' ]]; then
    alias "${1}"
    return
  fi
  cat $(which "${1}")
}
complete -c wcat

alias dnf-display-package-contents='dnf repoquery -l'
alias dnf-display-local-package-contents='dnf repoquery --installed -l'

[[ -e $HOME/.dir_colors ]] && eval $(dircolors ~/.dir_colors)

bind 'set mark-symlinked-directories on'

