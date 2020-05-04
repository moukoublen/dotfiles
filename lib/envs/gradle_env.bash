export GRADLE_HOME=$MARMALADE_ENVS/gradle/default
add_to_end_of_path_if_not_exists $GRADLE_HOME/bin
# export GRADLE_OPTS=""

################################################################################
# Marmalade Env Management
#
#
################################################################################
_marmalade_get_latest_version_number__gradle() {
  curl -s https://api.github.com/repos/gradle/gradle/releases/latest | jq -r '.name' | sed 's/ RC/-rc-/g'
}

_marmalade_get_local_latest_version_number__gradle() {
  ls -1 $MARMALADE_ENVS/gradle/ | grep -v default | sort -V | tail -n 1
}

_marmalade_install__gradle() {
  # $1: version e.g. 4.1
  curl -L --fail https://services.gradle.org/distributions/gradle-$1-bin.zip > /tmp/gradle.zip
  mkdir -p $MARMALADE_ENVS/gradle/$1
  unzip -qq /tmp/gradle.zip -d /tmp/
  mv /tmp/gradle-$1/* $MARMALADE_ENVS/gradle/$1
  rm /tmp/gradle.zip
  rm -rf /tmp/gradle-$1
}
