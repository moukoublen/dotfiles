################################################################################
# Put this in ~/.bashrc or ~/.bash_profile
#
# [[ -r ~/.marmalade.sh ]] && [[ -f ~/.marmalade.sh ]] && source ~/.marmalade.sh
#
################################################################################
path-abs() {
  local drnm="$(dirname $1)"
  echo $(cd -P $drnm && pwd)
}

path-real() {
  local SOURCE="$1"
  while [[ -L $SOURCE ]]; do
    local DIR="$(path-abs $SOURCE)"
    SOURCE="$(readlink --canonicalize-existing --no-newline $SOURCE)"
    [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE
  done
  echo "$(path-abs $SOURCE)"
}

export MARMALADE_PATH="$(path-real ${BASH_SOURCE[0]})"

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

for e in $( ls $MARMALADE_PATH/extras-* 2>/dev/null ); do
  source $e
done
################################################################################
################################################################################

add_to_path $MARMALADE_PATH/bin

load_path_file_to_path
#unset MARMALADE_PATH
