export PYENV_ROOT="$HOME/.pyenv"
add_to_start_of_path_if_not_exists $PYENV_ROOT/bin
if which pyenv > /dev/null 2>&1
then
  eval "$(pyenv init -)"
fi
alias update_pyenv='(cd ~/.pyenv/; git pull)'
alias install_pyenv='git clone https://github.com/yyuu/pyenv.git ~/.pyenv'
