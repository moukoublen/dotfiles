if [[ -d "${HOME}/.pyenv/bin" ]]; then
  export PYENV_ROOT="${HOME}/.pyenv"
  path-add "${PYENV_ROOT}/bin"
  eval "$(pyenv init -)"
fi
#alias update-pyenv='(cd ~/.pyenv/; git pull)'
#alias install-pyenv='git clone https://github.com/yyuu/pyenv.git ~/.pyenv'

alias pip3-outdated='pip3 list --user --outdated'
alias pip3-list='pip3 list --user'
