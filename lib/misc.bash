##################################################
## zoxide                   ##
if command -v zoxide 1>/dev/null 2>&1; then
  source <(zoxide init bash)
fi
##                                              ##
##################################################



##################################################
## fzf                                          ##
# https://github.com/junegunn/fzf
# https://github.com/sharkdp/fd
# sudo dnf install fzf fd-find

if [[ $(uname) = "Linux" ]]; then
  if [ -f /usr/share/fzf/shell/key-bindings.bash ]; then
    source /usr/share/fzf/shell/key-bindings.bash
  fi
fi
##                                              ##
##################################################



##################################################
## elastic                                      ##
if command -v elastic-package 1>/dev/null 2>&1; then
  source <(elastic-package completion bash)
fi
##                                              ##
##################################################



##################################################
## delta                                        ##
if command -v delta 1>/dev/null 2>&1; then
  source <(delta --generate-completion bash)
fi
##                                              ##
##################################################



##################################################
## aws                                          ##
if command -v aws_completer 1>/dev/null 2>&1; then
  complete -C "$(which aws_completer)" aws
fi

install-awscli2() {(
  "${DOTFILES_PATH}/scripts/install-awscli2" "$@"
)}
# sudo snap install aws-cli --classic
##                                              ##
##################################################



##################################################
## git                                          ##
if command -v gh 1>/dev/null 2>&1; then
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
