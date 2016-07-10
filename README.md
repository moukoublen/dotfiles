# dotfiles
**To install:**

```console
$ ln -s /path/to/dotfiles/marmalade.sh ~/.marmalade.sh
$ ln -s /path/to/dotfiles/pathmixer.sh ~/.pathmixer.sh
```

Create the file ~/.path and put what ever path that you want to be included to PATH (paths can contain enviroment variables).

Put this line to .bashrc or .bash_profile
```console
[[ -r ~/.marmalade.sh ]] && [[ -f ~/.marmalade.sh ]] && source ~/.marmalade.sh



