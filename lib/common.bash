alias to-ack='ack --files-from=-' #pipe find results
alias to-grep='xargs grep --color=auto' #pipe find results
alias path-to-lines='echo $PATH | tr ":" "\n"'
alias ld-to-lines='echo $LD_LIBRARY_PATH | tr ":" "\n"'

S() {
  find . -name "*$@*"
}