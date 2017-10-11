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
################################################################################
################################################################################

################################################################################
######### Paths ################################################################
add_to_start_of_path_if_not_exists $HOME/.local/bin
################################################################################
################################################################################

################################################################################
######### Functions for Gnome Setting. Theme and icons #########################
GS_get_gnome_theme_and_icons() {
  echo "org.gnome.desktop.interface gtk-theme      : $(gsettings get org.gnome.desktop.interface gtk-theme)"
  echo "org.gnome.desktop.wm.preferences theme     : $(gsettings get org.gnome.desktop.wm.preferences theme)"
  echo "org.gnome.shell.extensions.user-theme name : $(gsettings get org.gnome.shell.extensions.user-theme name)"
  echo "org.gnome.desktop.interface icon-theme     : $(gsettings get org.gnome.desktop.interface icon-theme)"
}

GS_set_gnome_theme() {
  gsettings set org.gnome.desktop.interface gtk-theme $1
  gsettings set org.gnome.desktop.wm.preferences theme $1
  gsettings set org.gnome.shell.extensions.user-theme name $1
}

GS_set_icon_theme() {
  gsettings set org.gnome.desktop.interface icon-theme $1
}

GS_set_adwaita_gnome_theme() {
  GS_set_gnome_theme 'Adwaita'
}

GS_update_materia() {
  #you should be in Materia repo directory
  GS_set_adwaita_gnome_theme
  sudo rm -rf /usr/share/themes/Flat-Plat{,-compact,-dark,-dark-compact,-light,-light-compact}
  sudo rm -rf /usr/share/themes/Materia{,-compact,-dark,-dark-compact,-light,-light-compact}
  sudo ./install.sh
  GS_set_gnome_theme 'Materia-light'
}

GS_update_evopop() {
  sudo rm -rf /usr/share/themes/EvoPop
  sudo rm -rf /usr/share/themes/EvoPop-Azure
  sudo cp -R ./EvoPop/ /usr/share/themes/
  sudo cp -R ./EvoPop-Azure/ /usr/share/themes/
}

GS_update_adapta() {
  sudo rm -rf /usr/share/themes/Adapta{,-Eta,-Nokto,-Nokto-Eta}
  ./autogen.sh --enable-parallel --disable-cinnamon --disable-unity --disable-xfce --disable-mate --disable-openbox
  make
  sudo make install
}

GS_update_papirus() {
  GS_set_icon_theme 'Adwaita'
  sudo rm -rf /usr/share/icons/{ePapirus,Papirus,Papirus-Dark,Papirus-Light}
  sudo cp --no-preserve=mode,ownership -r \
      ePapirus \
      Papirus \
      Papirus-Light \
      Papirus-Dark \
      /usr/share/icons
  gtk-update-icon-cache -q /usr/share/icons/ePapirus
  gtk-update-icon-cache -q /usr/share/icons/Papirus
  gtk-update-icon-cache -q /usr/share/icons/Papirus-Dark
  gtk-update-icon-cache -q /usr/share/icons/Papirus-Light
  GS_set_icon_theme 'Papirus'
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
################################################################################
################################################################################
