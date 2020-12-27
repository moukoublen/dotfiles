if command -v rbenv 1>/dev/null 2>&1; then
  add_to_path $HOME/.rbenv/bin
  eval "$(rbenv init -)"
fi
#alias update_rbenv='(cd ~/.rbenv/; git pull; cd ~/.rbenv/plugins/ruby-build/; git pull)'
#install-rbenv() {
#  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
#  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
#}
