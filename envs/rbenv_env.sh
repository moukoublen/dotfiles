add_to_start_of_path_if_not_exists $HOME/.rbenv/bin
if which rbenv > /dev/null 2>&1
then
  eval "$(rbenv init -)"
fi
alias update_rbenv='(cd ~/.rbenv/; git pull; cd ~/.rbenv/plugins/ruby-build/; git pull)'
install_rbenv() {
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
}
