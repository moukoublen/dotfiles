################################################################################
######### Marmalade Envs #######################################################
export MARMALADE_ENVS=$HOME/.marmalade.envs

for i in $MARMALADE_PATH/lib/envs/*_env.bash ; do
  if [ -r "$i" ]; then
    source "$i"
  fi
done
source $MARMALADE_PATH/lib/envs/env_management.bash
################################################################################
################################################################################

################################################################################
######### Paths ################################################################
add_to_path $HOME/.local/bin
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
alias java-ls='ll /etc/alternatives | grep /usr/lib/jvm | column -t'
################################################################################
################################################################################

if command -v java &> /dev/null; then
  export JAVA_HOME=$(path-abs $(path-real $(which java)))
  add_to_start_of_path_if_not_exists $JAVA_HOME/bin
fi

wcat() {
  cat $(which "${1}")
}

################################################################################
######### Fedora ###############################################################
alias dnf-display-package-contents='dnf repoquery -l'
alias dnf-display-local-package-contents='dnf repoquery --installed -l'
################################################################################
################################################################################

[[ -e $HOME/.dir_colors ]] && eval $(dircolors ~/.dir_colors)

bind 'set mark-symlinked-directories on'

