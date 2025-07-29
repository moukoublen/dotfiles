##################################################
## zoxide                   ##
if [[ -x /usr/bin/zoxide ]]; then
  # https://www.shellcheck.net/wiki/SC1090
  # shellcheck source=/dev/null
  source <(zoxide init bash)
fi
##                                              ##
##################################################

##################################################
## fzf                                          ##
# https://github.com/junegunn/fzf
# https://github.com/sharkdp/fd
# sudo dnf install fzf fd-find

if [[ -x /usr/bin/fzf ]]; then
  if [ -f /usr/share/fzf/shell/key-bindings.bash ]; then
    source /usr/share/fzf/shell/key-bindings.bash
  fi
fi

if [ -d /opt/homebrew/opt/fzf/shell ]; then
  source /opt/homebrew/opt/fzf/shell/key-bindings.bash
  source /opt/homebrew/opt/fzf/shell/completion.bash
fi
##                                              ##
##################################################

##################################################
## aws                                          ##
if [[ -x /usr/local/bin/aws_completer ]]; then
  complete -C "$(which aws_completer)" aws
fi

install-awscli2() {
  "${DOTFILES_PATH}/scripts/install-awscli2" "${@}"
}
# sudo snap install aws-cli --classic
##                                              ##
##################################################

##################################################
## git                                          ##
if [[ -x /usr/local/bin/gh ]]; then
  # https://www.shellcheck.net/wiki/SC1090
  # shellcheck source=/dev/null
  source <(gh completion --shell bash)
fi

alias gcl='git config --local --list'
##                                              ##
##################################################

##################################################
## java                                         ##
alias java-ls='ll /etc/alternatives | grep /usr/lib/jvm | column -t'

# if command -v java &> /dev/null; then
#   export JAVA_HOME=$(path-abs $(path-real $(which java)))
#   #path-add $JAVA_HOME/bin
# fi
##                                              ##
##################################################
