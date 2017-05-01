####################################################################
# Linux
# #### Notes ####
# who # Show terminals. Stupid but I keep forgetting it.
# tar -C /usr/java -xzf jdk-8u112-linux-x64.tar.gz
# sudo timedatectl set-local-rtc 1
# gsettings set org.gnome.software download-updates false
# gsettings set org.gnome.nautilus.preferences recursive-search never
# gsettings set org.gnome.nautilus.preferences default-folder-viewer 'list-view'
# gsettings set org.gnome.nautilus.preferences show-hidden-files true
# gsettings set org.gnome.nautilus.preferences sort-directories-first true
# gsettings set org.gnome.desktop.privacy remember-recent-files false
#
# #Terminal Colors#
# background-color: #303030 - rgb(48,48,48)
# foreground-color: #DDDDDD - rgb(221,221,221)
# palette: ['#000000','#CC0000','#4D9A05','#C3A000','#3464A3','#754F7B','#05979A','#D3D6CF','#545652','#EF2828','#89E234','#FBE84F','#729ECF','#AC7EA8','#34E2E2','#EDEDEB']
#
####################################################################

##################### Generic Aliases ##############################
alias getwmclass='xprop WM_CLASS'
alias ll='command ls -la --color=auto'
alias tree='command tree -C'
alias go-to-runlevel-3='sudo systemctl set-default multi-user.target'
alias go-to-runlevel-5='sudo systemctl set-default graphical.target'
alias G++='g++ -Wall -Wextra -Wfloat-equal -Wundef -Wcast-align -Wwrite-strings -Wlogical-op -Wmissing-declarations -Wredundant-decls -Wshadow -Woverloaded-virtual'
alias g++14='g++ -std=c++14 '
alias clang++14='clang++ -std=c++14 '
alias S='find . -name '
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
export M3_HOME=/opt/maven/default
export M3=$M3_HOME/bin
export MAVEN_OPTS="-Xmx2048m -Xms256m"
add_to_end_of_path_if_not_exists $M3
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
##################### sbt ##########################################
export SBT_HOME=/opt/sbt/default
add_to_end_of_path_if_not_exists $SBT_HOME/bin
####################################################################
####################################################################

####################################################################
##################### Groovy #######################################
export GROOVY_HOME=/opt/groovy/default
add_to_end_of_path_if_not_exists $GROOVY_HOME/bin
####################################################################
####################################################################

####################################################################
##### Functions for Gnome Setting. Theme and icons #################
function GS-get-gnome-theme-and-icons {
  echo "org.gnome.desktop.interface gtk-theme     : $(gsettings get org.gnome.desktop.interface gtk-theme)"
  echo "org.gnome.desktop.wm.preferences theme    : $(gsettings get org.gnome.desktop.wm.preferences theme)"
  echo "org.gnome.shell.extensions.user-theme name: $(gsettings get org.gnome.shell.extensions.user-theme name)"
  echo "org.gnome.desktop.interface icon-theme    : $(gsettings get org.gnome.desktop.interface icon-theme)"
}

function GS-set-gnome-theme {
  gsettings set org.gnome.desktop.interface gtk-theme $1
  gsettings set org.gnome.desktop.wm.preferences theme $1
  gsettings set org.gnome.shell.extensions.user-theme name $1
}

function GS-set-flat-plat-gnome-theme {
  GS-set-gnome-theme 'Flat-Plat-light'
}

function GS-set-adwaita-gnome-theme {
  GS-set-gnome-theme 'Adwaita'
}

function GS-set-icon-theme {
  gsettings set org.gnome.desktop.interface icon-theme $1
}
####################################################################
####################################################################

################################################################################
######### Ubuntu ###############################################################
alias wifi_restart='sudo systemctl restart network-manager.service'
export JUJU_REPOSITORY=$HOME/charms
################################################################################
################################################################################

################################################################################
######### Fedora ###############################################################
alias DisplayPackageContents='dnf repoquery -l'
################################################################################
################################################################################
