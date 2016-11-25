####################################################################
# Linux
# #### Notes ####
# gsettings set org.gnome.software download-updates false
# gsettings set org.gnome.nautilus.preferences recursive-search never
# gsettings set org.gnome.desktop.privacy remember-recent-files false
####################################################################

## DNF ############################################################
alias DisplayPackageContents='dnf repoquery -l'
####################################################################
####################################################################


####################################################################
## JAVA ############################################################
export JAVA_HOME=/usr/java/default
add_to_start_of_path_if_not_exists $JAVA_HOME/bin
export IDEA_JDK=$JAVA_HOME
export STUDIO_JDK=$JAVA_HOME
export CL_JDK=$JAVA_HOME
####################################################################
####################################################################

####################################################################
## NODE ############################################################
export NODE_HOME=/opt/node/default
add_to_end_of_path_if_not_exists $NODE_HOME/bin
####################################################################
####################################################################

####################################################################
## Maven ###########################################################
export M2_HOME=/opt/maven/default
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xmx2048m -Xms256m"
add_to_end_of_path_if_not_exists $M2
####################################################################
####################################################################

####################################################################
## Gradle ##########################################################
export GRADLE_HOME=/opt/gradle/default
add_to_end_of_path_if_not_exists $GRADLE_HOME/bin
# export GRADLE_OPTS=""
####################################################################
####################################################################

####################################################################
## SCALA ###########################################################
export SCALA_HOME=/usr/scala/default
add_to_end_of_path_if_not_exists $SCALA_HOME/bin
# export GRADLE_OPTS=""
####################################################################
####################################################################

####################################################################
## rbenv ###########################################################
add_to_start_of_path_if_not_exists $HOME/.rbenv/bin
####################################################################
####################################################################

####################################################################
## pyenv ###########################################################
export PYENV_ROOT="$HOME/.pyenv"
add_to_start_of_path_if_not_exists $PYENV_ROOT/bin
####################################################################
####################################################################

alias update_pyenv='(cd ~/.pyenv/; git pull)'
alias update_rbenv='(cd ~/.rbenv/; git pull; cd ~/.rbenv/plugins/ruby-build/; git pull)'
alias ll='command ls -la --color=auto'
alias getwmclass='xprop WM_CLASS'
alias tree='tree -C'


function print-gnome-theme-settings() {
  echo "gsettings get org.gnome.desktop.interface gtk-theme  : $(gsettings get org.gnome.desktop.interface gtk-theme)"
  echo "gsettings get org.gnome.desktop.wm.preferences theme : $(gsettings get org.gnome.desktop.wm.preferences theme)"
  echo "gsettings get org.gnome.desktop.interface icon-theme : $(gsettings get org.gnome.desktop.interface icon-theme)"
}
