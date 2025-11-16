bind 'set mark-symlinked-directories on'

export HISTSIZE=
export HISTFILESIZE=

alias path-to-lines='echo $PATH | tr ":" "\n"'
alias xdg-data-to-lines='echo $XDG_DATA_DIRS | tr ":" "\n"'
alias infopath-to-lines='echo $INFOPATH | tr ":" "\n"'
alias ld-to-lines='echo $LD_LIBRARY_PATH | tr ":" "\n"'

S() {
  find . -name "*${*}*"
}

gg() {
  rg --json --context=2 "${@}" | delta
}

# -C NUM, --context=NUM    Show NUM lines before and after each match.
