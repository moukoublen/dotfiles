##################################################
## zoxide                   ##
if [[ -x /usr/bin/zoxide ]]; then
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
elif [[ -x "${HOMEBREW_PREFIX}/bin/fzf" ]]; then
  # fzf --bash > ~/.fzf.bash
  if [ -f ~/.fzf.bash ]; then
    source ~/.fzf.bash
  fi
  #eval "$(fzf --bash)"
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
if [[ -x /usr/local/bin/delta ]]; then
  source <(delta --generate-completion bash)
fi
##                                              ##
##################################################



##################################################
## aws                                          ##
if [[ -x /usr/local/bin/aws_completer ]]; then
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
if [[ -x /usr/local/bin/gh ]]; then
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
