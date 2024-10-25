bind 'set mark-symlinked-directories on'

HISTSIZE=30000
HISTFILESIZE=30000

alias path-to-lines='echo $PATH | tr ":" "\n"'
alias xdg-data-to-lines='echo $XDG_DATA_DIRS | tr ":" "\n"'
alias infopath-to-lines='echo $INFOPATH | tr ":" "\n"'
alias ld-to-lines='echo $LD_LIBRARY_PATH | tr ":" "\n"'
S() {
  find . -name "*${*}*"
}

bb() {
  local cmd='source-highlight --no-doc --out-format=esc --tab=2'
  ${cmd} --infer-lang --input "${@}" 2>/dev/null || ${cmd} --src-lang=shell --input "${@}"
}
