# Marmalade Dotfiles

#### Installation

Run `install.sh`.

#### Installation via url

```
. <(curl -fsSL https://git.io/moukoublen_dotfiles)
```

#### Manual installation

```console
$ ln -s /path/to/dotfiles/marmalade.sh ~/.marmalade.sh
$ echo '[[ -r ~/.marmalade.sh ]] && [[ -f ~/.marmalade.sh ]] && source ~/.marmalade.sh' >> ~/.bashrc
```

#### Notes

Create the file `~/.path` and put what ever path that you want to be included to PATH (paths can contain environment variables).


You can put things that you do not want to upload to git in `/path/to/dotfiles/extras_marmalade.sh` file (e.g. work related stuff) which is excluded by `.gitignore`.
