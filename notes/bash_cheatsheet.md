### ${@} vs. ${*}
  * ${@}: Expands each positional parameter into a separate word. When quoted as "${@}", it becomes "$1" "$2" "$3", preserving the separation of arguments—even if they contain spaces.
  * ${*}: Expands all positional parameters into a single word. When quoted as "${*}", it becomes "$1 $2 $3", concatenating all arguments into one string separated by the first character of the IFS (Internal Field Separator, usually a space).

