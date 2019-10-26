################################################################################
# Put this in ~/.bashrc or ~/.bash_profile
#
# [[ -r ~/.marmalade.sh ]] && [[ -f ~/.marmalade.sh ]] && source ~/.marmalade.sh
#
################################################################################
abspth() {
  drnm="$(dirname $1)"
  echo "$(cd -P $drnm && pwd)"
}

rlpth() {
  SOURCE=$1
  while [ -h "$SOURCE" ]; do
    DIR="$(abspth $SOURCE)"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
  done
  echo "$(abspth $SOURCE)"
}

export MARMALADE_PATH="$(rlpth ${BASH_SOURCE[0]})"

source $MARMALADE_PATH/pathmixer.sh

# Mac or Linux?
if [[ $(uname) = "Darwin" ]]; then
  source $MARMALADE_PATH/macos_marmalade.sh
else
  source $MARMALADE_PATH/linux_marmalade.sh
fi

for e in $( ls $MARMALADE_PATH/extras_*.sh 2>/dev/null ); do
  source $e
done

add_to_path $MARMALADE_PATH/bin

################################################################################
######### Colors PS1 ###########################################################
source $MARMALADE_PATH/marmalade_ps1.sh
################################################################################
################################################################################

################################################################################
######### Aliases ##############################################################
alias S='find . -name'
alias to_ack='ack --files-from=-' #pipe find results
alias to_grep='xargs grep --color=auto' #pipe find results
alias path_to_lines='echo $PATH | tr ":" "\n"'
alias ld_to_lines='echo $LD_LIBRARY_PATH | tr ":" "\n"'
alias update_dotfiles="(cd ${MARMALADE_PATH}; git pull)"
alias MVN_NO_TESTS="mvn -Dmaven.test.skip=true -DskipTests=true"
################################################################################
################################################################################

load_path_file_to_path
#unset MARMALADE_PATH
