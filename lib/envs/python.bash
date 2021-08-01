if command -v ${HOME}/.local/bin/pip3 1>/dev/null 2>&1; then
  source <(${HOME}/.local/bin/pip3 completion --bash)
fi


if [[ -d $HOME/.pyenv/bin ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  add_to_path $PYENV_ROOT/bin
  eval "$(pyenv init -)"
fi
#alias update-pyenv='(cd ~/.pyenv/; git pull)'
#alias install-pyenv='git clone https://github.com/yyuu/pyenv.git ~/.pyenv'
