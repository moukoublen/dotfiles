if command -v aws_completer 1>/dev/null 2>&1; then
  complete -C "$(which aws_completer)" aws
fi

install-awscli2() {(
  # To upgrade run with --update
  tmp_dir=$(mktemp --directory)
  cd $tmp_dir
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install "$@"
  cd ~
  rm -rf $tmp_dir
)}
