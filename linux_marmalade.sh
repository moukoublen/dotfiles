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
######### Java #################################################################
if [ -d /usr/lib/jvm/java ] # fedora openjdk
then
  export JAVA_HOME=/usr/lib/jvm/java
elif [ -d /usr/lib/jvm/default-java ] # ubuntu openjdk
then
  export JAVA_HOME=/usr/lib/jvm/default-java
elif [ -d /usr/java/default ] # oracle
then
  export JAVA_HOME=/usr/java/default
  add_to_start_of_path_if_not_exists $JAVA_HOME/bin
fi

#export IDEA_JDK=$JAVA_HOME
#export STUDIO_JDK=$JAVA_HOME
#export CL_JDK=$JAVA_HOME
################################################################################
################################################################################

################################################################################
######### Maven ################################################################
export M3_HOME=/opt/maven/default
export M3=$M3_HOME/bin
export MAVEN_OPTS="-Xmx2048m -Xms256m"
add_to_end_of_path_if_not_exists $M3
################################################################################
################################################################################

################################################################################
######### Gradle ###############################################################
export GRADLE_HOME=/opt/gradle/default
add_to_end_of_path_if_not_exists $GRADLE_HOME/bin
# export GRADLE_OPTS=""
################################################################################
################################################################################

################################################################################
######### Scala ################################################################
export SCALA_HOME=/opt/scala/default
add_to_end_of_path_if_not_exists $SCALA_HOME/bin
################################################################################
################################################################################

################################################################################
######### Kotlin ###############################################################
add_to_end_of_path_if_not_exists /opt/kotlin/default/bin
################################################################################
################################################################################

################################################################################
######### sbt ##################################################################
export SBT_HOME=/opt/sbt/default
add_to_end_of_path_if_not_exists $SBT_HOME/bin
################################################################################
################################################################################

################################################################################
######### Groovy ###############################################################
export GROOVY_HOME=/opt/groovy/default
add_to_end_of_path_if_not_exists $GROOVY_HOME/bin
################################################################################
################################################################################

################################################################################
######### Node #################################################################
export NODE_HOME=/opt/node/default
add_to_end_of_path_if_not_exists $NODE_HOME/bin
#if which npm > /dev/null 2>&1; then source <(npm completion); fi
get_node() {
  #$1 : node version e.g.  "8.4.0"
  curl -L https://nodejs.org/dist/v$1/node-v$1-linux-x64.tar.xz > /tmp/node.tar.xz
  sudo tar xf /tmp/node.tar.xz -C /opt/node/
}
################################################################################
################################################################################

################################################################################
######### Android SDK ##########################################################
export ANDR_PT="$HOME/Android/Sdk/platform-tools"
android_to_path() {
  add_to_start_of_path_if_not_exists $ANDR_PT
}
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

GS_update_flatplat() {
  #you should be in Flat-Plat repo directory
  GS_set_adwaita_gnome_theme
  sudo rm -rf /usr/share/themes/Flat-Plat{,-compact,-dark,-dark-compact,-light,-light-compact}
  sudo ./install.sh
  GS_set_gnome_theme 'Flat-Plat-light'
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
