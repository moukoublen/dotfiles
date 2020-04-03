if [[ -d $PYENV_ROOT/bin ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  add_to_start_of_path_if_not_exists $PYENV_ROOT/bin
  eval "$(pyenv init -)"
fi
alias update-pyenv='(cd ~/.pyenv/; git pull)'
alias install-pyenv='git clone https://github.com/yyuu/pyenv.git ~/.pyenv'
