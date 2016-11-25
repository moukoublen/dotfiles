####################################################################
# Put this in ~/.bashrc or ~/.bash_profile
#
# [[ -r ~/.marmalade.sh ]] && [[ -f ~/.marmalade.sh ]] && source ~/.marmalade.sh
#
####################################################################
export MARMALADE_PATH=$(realpath ~/.marmalade.sh | sed 's/\/marmalade.sh//g')
source $MARMALADE_PATH/pathmixer.sh
# Mac or Linux?
if [ "$(uname)" == "Darwin" ]; then
  source $MARMALADE_PATH/macos_marmalade.sh
else
  source $MARMALADE_PATH/linux_marmalade.sh  
fi

if [ -f $MARMALADE_PATH/extras_marmalade.sh ]; then
  source $MARMALADE_PATH/extras_marmalade.sh
fi

####################################################################
## Colors PS1 ######################################################
if [[ ! -z $BASH ]]; then
  PS1="\[\033[36m\]╭ \u@\h\[\033[m\] \[\033[32m\]\w\[\033[m\]\[\033[36m\] \n╰\[\033[m\] "
fi
####################################################################
####################################################################

####################################################################
## ALIAS ###########################################################
alias path_to_lines='echo $PATH | tr ":" "\n"'
alias ld_to_lines='echo $LD_LIBRARY_PATH | tr ":" "\n"'
alias g++14='g++ -std=c++14 '
alias clang++14='clang++ -std=c++14 '
alias untar='tar xvf'
alias untargz='tar -zxvf'
####################################################################
####################################################################

####################################################################
## GO Programming Language #########################################
# No need of GOROOT in case of default path (/usr/local/go)
#export GOROOT=/path/to/special/go
add_to_start_of_path_if_not_exists /usr/local/go/bin
export GOPATH=$HOME/goworkspace
alias setGoPathBinToPath='export PATH=$PATH:$GOPATH/bin'
####################################################################
####################################################################

if which rbenv > /dev/null 2>&1; then eval "$(rbenv init -)"; fi
if which pyenv > /dev/null 2>&1; then eval "$(pyenv init -)"; fi

unset MARMALADE_PATH
