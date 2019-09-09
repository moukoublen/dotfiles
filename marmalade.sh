################################################################################
# Put this in ~/.bashrc or ~/.bash_profile
#
# [[ -r ~/.marmalade.sh ]] && [[ -f ~/.marmalade.sh ]] && source ~/.marmalade.sh
#
################################################################################
rlpth() {
  SOURCE=$1
  while [ -h "$SOURCE" ]; do
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
  done
  echo "$( cd -P "$( dirname "$SOURCE" )" && pwd )"
}

export MARMALADE_PATH="$(rlpth ${BASH_SOURCE[0]})"

source $MARMALADE_PATH/pathmixer.sh

# Mac or Linux?
if [[ $(uname) = "Darwin" ]]; then
  source $MARMALADE_PATH/macos_marmalade.sh
else
  source $MARMALADE_PATH/linux_marmalade.sh
fi

for e in $MARMALADE_PATH/extras_*.sh; do
  source $e
done

################################################################################
######### Colors PS1 ###########################################################
source $MARMALADE_PATH/marmalade_ps1.sh
################################################################################
################################################################################

################################################################################
######### Aliases ##############################################################
alias path_to_lines='echo $PATH | tr ":" "\n"'
alias ld_to_lines='echo $LD_LIBRARY_PATH | tr ":" "\n"'
alias update_dotfiles="(cd ${MARMALADE_PATH}; git pull)"
alias MVN_NO_TESTS="mvn -Dmaven.test.skip=true -DskipTests=true"
################################################################################
################################################################################

load_path_file_to_path
#unset MARMALADE_PATH
