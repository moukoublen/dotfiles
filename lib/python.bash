if command -v "${HOME}/.local/bin/pip3" 1>/dev/null 2>&1; then
  source <(${HOME}/.local/bin/pip3 completion --bash)
elif command -v /usr/bin/pip3 1>/dev/null 2>&1; then
  source <(/usr/bin/pip3 completion --bash)
fi


if [[ -d "${HOME}/.pyenv/bin" ]]; then
  export PYENV_ROOT="${HOME}/.pyenv"
  path-add "${PYENV_ROOT}/bin"
  eval "$(pyenv init -)"
fi
#alias update-pyenv='(cd ~/.pyenv/; git pull)'
#alias install-pyenv='git clone https://github.com/yyuu/pyenv.git ~/.pyenv'

alias pip3-outdated='pip3 list --user --outdated'
alias pip3-list='pip3 list --user'

# pip install --user --upgrade <package>

## Ansible
# sudo dnf install ansible
# or
# pip3 install --user ansible
# python3 -m pip install --upgrade --user ansible
