if [[ ! -z $BASH ]]; then
    if [[ $EUID -eq 0 ]]; then
        PS1="\[\e[33m\][\[\e[m\]\[\e[31m\]\u \[\e[33m\]\W\[\e[m\]\[\e[33m\]]\[\e[m\] # "
    else
        PS1="\[\e[36m\][\[\e[m\]\[\e[34m\]\u \[\e[32m\]\W\[\e[m\]\[\e[36m\]]\[\e[m\] \$ "
    fi
fi
