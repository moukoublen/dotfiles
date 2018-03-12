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
################################################################################
################################################################################

################################################################################
######### Paths ################################################################
add_to_start_of_path_if_not_exists $HOME/.local/bin
add_to_start_of_path_if_not_exists $MARMALADE_PATH/scripts
################################################################################
################################################################################

################################################################################
######### Functions for Gnome Setting. Theme and icons #########################
GS_update_materia() {
  #you should be in Materia repo directory
  GS_set_adwaita_gnome_theme
  sudo rm -rf /usr/share/themes/Flat-Plat{,-compact,-dark,-dark-compact,-light,-light-compact}
  sudo rm -rf /usr/share/themes/Materia{,-compact,-dark,-dark-compact,-light,-light-compact}
  sudo ./install.sh
  GS_set_gnome_theme 'Materia-light'
}

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
enable_rpmfusion() {
  sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
}

enable_fedy() {
   sudo dnf install https://dl.folkswithhats.org/fedora/$(rpm -E %fedora)/RPMS/folkswithhats-release.noarch.rpm
}
################################################################################
################################################################################
