####################################################################
# Linux
# #### Notes ####
# who # Show terminals. Stupid but I keep forgetting it.
# tar -C /usr/java -xzf jdk-8u112-linux-x64.tar.gz
# gsettings set org.gnome.software download-updates false
# gsettings set org.gnome.nautilus.preferences recursive-search never
# gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
# gsettings set org.gnome.nautilus.preferences show-hidden-files true
# gsettings set org.gnome.nautilus.preferences sort-directories-first true
# gsettings set org.gnome.desktop.privacy remember-recent-files false
####################################################################

##################### Generic Aliases ##############################
alias getwmclass='xprop WM_CLASS'
alias ll='command ls -la --color=auto'
alias tree='tree -C'
alias DisplayPackageContents='dnf repoquery -l'
alias wifi_restart='sudo systemctl restart network-manager.service'
####################################################################

####################################################################
##################### Java #########################################
export JAVA_HOME=/usr/java/default
add_to_start_of_path_if_not_exists $JAVA_HOME/bin
export IDEA_JDK=$JAVA_HOME
export STUDIO_JDK=$JAVA_HOME
export CL_JDK=$JAVA_HOME
####################################################################
####################################################################

####################################################################
##################### Node #########################################
export NODE_HOME=/opt/node/default
add_to_end_of_path_if_not_exists $NODE_HOME/bin
if which npm > /dev/null 2>&1; then source <(npm completion); fi
####################################################################
####################################################################

####################################################################
##################### Maven ########################################
export M2_HOME=/opt/maven/default
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xmx2048m -Xms256m"
add_to_end_of_path_if_not_exists $M2
####################################################################
####################################################################

####################################################################
##################### Gradle #######################################
export GRADLE_HOME=/opt/gradle/default
add_to_end_of_path_if_not_exists $GRADLE_HOME/bin
# export GRADLE_OPTS=""
####################################################################
####################################################################

####################################################################
##################### Scala ########################################
export SCALA_HOME=/opt/scala/default
add_to_end_of_path_if_not_exists $SCALA_HOME/bin
####################################################################
####################################################################

####################################################################
##################### Groovy #######################################
export GROOVY_HOME=/opt/groovy/default
add_to_end_of_path_if_not_exists $GROOVY_HOME/bin
####################################################################
####################################################################

####################################################################
##################### Ubuntu Juju ##################################
export JUJU_REPOSITORY=$HOME/charms
####################################################################
####################################################################

function print-gnome-theme-settings() {
  echo "gsettings get org.gnome.desktop.interface gtk-theme  : $(gsettings get org.gnome.desktop.interface gtk-theme)"
  echo "gsettings get org.gnome.desktop.wm.preferences theme : $(gsettings get org.gnome.desktop.wm.preferences theme)"
  echo "gsettings get org.gnome.desktop.interface icon-theme : $(gsettings get org.gnome.desktop.interface icon-theme)"
}
