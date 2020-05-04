################################################################################
# Put this in ~/.bashrc or ~/.bash_profile
#
# [[ -r ~/.marmalade.sh ]] && [[ -f ~/.marmalade.sh ]] && source ~/.marmalade.sh
#
################################################################################
abspth() {
  local drnm="$(dirname $1)"
  echo "$(cd -P $drnm && pwd)"
}

rlpth() {
  local SOURCE=$1
  while [ -h "$SOURCE" ]; do
    local DIR="$(abspth $SOURCE)"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE
  done
  echo "$(abspth $SOURCE)"
}

export MARMALADE_PATH="$(rlpth ${BASH_SOURCE[0]})"

################################################################################
######### Source libs ##########################################################
source $MARMALADE_PATH/lib/ps1.bash
source $MARMALADE_PATH/lib/pathmixer.bash
source $MARMALADE_PATH/lib/common.bash

# Mac or Linux?
if [[ $(uname) = "Darwin" ]]; then
  source $MARMALADE_PATH/lib/macos_marmalade.bash
else
  source $MARMALADE_PATH/lib/linux_marmalade.bash
fi

for e in $( ls $MARMALADE_PATH/extras_* 2>/dev/null ); do
  source $e
done
################################################################################
################################################################################

add_to_path $MARMALADE_PATH/bin

load_path_file_to_path
#unset MARMALADE_PATH
