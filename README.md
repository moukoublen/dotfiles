# Marmalade Dotfiles

#### Installation

Run `install`.

#### Installation via url

```
. <(curl -fsSL https://raw.githubusercontent.com/moukoublen/dotfiles/master/scripts/clone-dotfiles)
```

#### Manual installation

```console
$ ln -s /path/to/dotfiles/marmalade.bash ~/.marmalade.bash
$ echo '[[ -r ~/.marmalade.bash ]] && [[ -f ~/.marmalade.bash ]] && source ~/.marmalade.bash' >> ~/.bashrc
```

#### Notes

Create the file `~/.path` and put what ever path that you want to be included to PATH (paths can contain environment variables).


You can put things that you do not want to upload to git in `/path/to/dotfiles/extras_<whatever>.sh` file (e.g. work related stuff) which is excluded by `.gitignore`.
