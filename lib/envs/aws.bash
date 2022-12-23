if command -v aws_completer 1>/dev/null 2>&1; then
  complete -C "$(which aws_completer)" aws
fi

install-awscli2() {(
  "${DOTFILES_PATH}/scripts/install-awscli2" "$@"
)}

# sudo snap install aws-cli --classic
