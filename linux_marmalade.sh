################################################################################
######### Marmalade Envs #######################################################
export MARMALADE_ENVS=$HOME/.marmalade.envs

for i in $MARMALADE_PATH/envs/*_env.sh ; do
  if [ -r "$i" ]; then
    source "$i"
  fi
done
source $MARMALADE_PATH/envs/env_management_marmalade.sh
################################################################################
################################################################################

################################################################################
######### Aliases ##############################################################
alias ll='command ls -la --color=auto'
alias tree='command tree -C'
alias go_to_runlevel_3='sudo systemctl set-default multi-user.target'
alias go_to_runlevel_5='sudo systemctl set-default graphical.target'
alias get_wm_class='xprop WM_CLASS'
alias S='find . -name'
alias to_ack='ack --files-from=-' #pipe find results
alias to_grep='xargs grep --color=auto' #pipe find results
alias O='xdg-open'
alias JAVALS='ll /etc/alternatives | grep /usr/lib/jvm | column -t'
################################################################################
################################################################################

################################################################################
######### Paths ################################################################
add_to_start_of_path_if_not_exists $HOME/.local/bin
add_to_start_of_path_if_not_exists $MARMALADE_PATH/scripts
add_to_start_of_path_if_not_exists $MARMALADE_PATH/bin
################################################################################
################################################################################

################################################################################
######### Fedora ###############################################################
alias display_package_contents_dnf='dnf repoquery -l'
alias display_local_package_contents_dnf='dnf repoquery --installed -l'
################################################################################
################################################################################
