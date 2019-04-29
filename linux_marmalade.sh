################################################################################
######### Marmalade Envs #######################################################
export MARMALADE_ENVS=$HOME/.marmalade.envs

for i in $MARMALADE_PATH/envs/*_env.sh ; do
  if [ -r "$i" ]; then
    . "$i"
  fi
done
. $MARMALADE_PATH/env_management_marmalade.sh
################################################################################
################################################################################

################################################################################
######### Aliases ##############################################################
alias get_wm_class='xprop WM_CLASS'
alias ll='command ls -la --color=auto'
alias tree='command tree -C'
alias go_to_runlevel_3='sudo systemctl set-default multi-user.target'
alias go_to_runlevel_5='sudo systemctl set-default graphical.target'
alias G++='g++ -Wall -Wextra -Wfloat-equal -Wundef -Wcast-align -Wwrite-strings -Wlogical-op -Wmissing-declarations -Wredundant-decls -Wshadow -Woverloaded-virtual'
alias S='find . -name '
alias to_ack='ack --files-from=-' #pipe find results
alias to_grep='xargs grep --color=auto' #pipe find results
alias o='xdg-open'
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
######### Ubuntu ###############################################################
alias restart_network_manager='sudo systemctl restart network-manager.service'
alias reload_kernel_variables='sudo systemctl restart procps.service'
export JUJU_REPOSITORY=$HOME/charms
################################################################################
################################################################################

################################################################################
######### Fedora ###############################################################
alias display_package_contents_dnf='dnf repoquery -l'
alias display_local_package_contents_dnf='dnf repoquery --installed -l'
################################################################################
################################################################################

################################################################################
######### ulimit ###############################################################
ulimit -S -s unlimited
################################################################################
################################################################################
