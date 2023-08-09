# export SBT_HOME=$DOTFILES_ENVS/sbt/default
# add_to_path $SBT_HOME/bin "after"

################################################################################
# Marmalade Env Management
################################################################################
# _marmalade_get_latest_version_number__sbt() {
#   curl -s https://api.github.com/repos/sbt/sbt/releases/latest | jq -r '.name'
# }

# _marmalade_get_local_latest_version_number__sbt() {
#   ls -1 $DOTFILES_ENVS/sbt/ | grep -v default | sort -V | tail -n 1
# }

# _marmalade_install__sbt() {
#   # $1: version e.g. 4.1
#   # https://github.com/sbt/sbt/releases/download/v1.0.2/sbt-1.0.2.zip
#   curl -L --fail https://github.com/sbt/sbt/releases/download/v$1/sbt-$1.zip > /tmp/sbt.zip
#   mkdir -p $DOTFILES_ENVS/sbt/$1
#   unzip -qq /tmp/sbt.zip -d /tmp/
#   mv /tmp/sbt/* $DOTFILES_ENVS/sbt/$1
#   rm /tmp/sbt.zip
#   rm -rf /tmp/sbt
# }
