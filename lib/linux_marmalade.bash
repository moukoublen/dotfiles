################################################################################
######### Paths ################################################################
add_to_path ${HOME}/.local/bin
add_to_path ${HOME}/bin
################################################################################
################################################################################


################################################################################
######### Aliases and Functions ################################################
alias O='xdg-open'
alias ll='command ls -la --color=auto'
alias tree='command tree -C'
alias go-to-runlevel-3='sudo systemctl set-default multi-user.target'
alias go-to-runlevel-5='sudo systemctl set-default graphical.target'
alias get-wm-class='xprop WM_CLASS'
alias PGREP='p | grep'
alias crl='curl --silent --show-error --fail --location'
alias p='ps -A --format=user,pid,ppid,%cpu,%mem,vsz,rss,tty,stat,start_time,command --sort=-user,-ppid,-pid -ww'
alias p-tree='ps -A -F --forest -ww'

sedit() {
  gnome-text-editor admin://"$1"
}

alias dnf-display-package-contents='dnf repoquery -l'
alias dnf-display-local-package-contents='dnf repoquery --installed -l'
################################################################################
################################################################################


################################################################################
######### Marmalade Envs #######################################################
export DOTFILES_ENVS=${HOME}/.marmalade.envs

for i in ${DOTFILES_PATH}/lib/envs/*.bash ; do
  if [ -r "${i}" ]; then
    source "${i}"
  fi
done
################################################################################
################################################################################


export EDITOR=/usr/bin/vim

[[ -e $HOME/.dir_colors ]] && eval $(dircolors ~/.dir_colors)
