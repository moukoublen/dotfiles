if [[ -d $HOME/.pyenv/bin ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  add_to_path $PYENV_ROOT/bin
  eval "$(pyenv init -)"
fi
#alias update-pyenv='(cd ~/.pyenv/; git pull)'
#alias install-pyenv='git clone https://github.com/yyuu/pyenv.git ~/.pyenv'
