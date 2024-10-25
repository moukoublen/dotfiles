# Dotfiles

#### Installation

Run `install`.

#### Installation via url

```
. <(curl -fsSL https://raw.githubusercontent.com/moukoublen/dotfiles/main/scripts/clone-dotfiles)
```

#### Manual installation

```console
$ ln -s /path/to/dotfiles/root.bash ~/.dotfiles.bash
$ echo '[[ -r ~/.dotfiles.bash ]] && [[ -f ~/.dotfiles.bash ]] && source ~/.dotfiles.bashh' >> ~/.bashrc
```
