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
alias tree='command tree -C -a'
alias crl='curl --silent --show-error --fail --location'
alias p='ps -A --format=user,pid,ppid,%cpu,%mem,vsz,rss,tty,stat,start_time,command --sort=-user,-ppid,-pid -ww'
alias p-tree='ps -A -F --forest -ww'
#alias get-wm-class='xprop WM_CLASS'
#alias go-to-runlevel-3='sudo systemctl set-default multi-user.target'
#alias go-to-runlevel-5='sudo systemctl set-default graphical.target'

sedit() {
  gnome-text-editor admin://"${1}"
}

alias dnf-display-package-contents='dnf repoquery -l'
alias dnf-display-local-package-contents='dnf repoquery --installed -l'
################################################################################
################################################################################


export EDITOR=/usr/bin/vim

[[ -e $HOME/.dir_colors ]] && eval $(dircolors ~/.dir_colors)
