path-add() {
  if [[ ${1} == "" ]]; then
    return
  fi

  if [[ ":${PATH}:" == *":${1}:"* ]]; then
    return
  fi

  if [[ ${2} == "after" ]]; then
    export PATH="${PATH}:${1}"
  else
    export PATH="${1}:${PATH}"
  fi
}

# Alternative:
# case ":${PATH}:" in
#   *":${1}:"*) ;;
#   *) export PATH="${1}:${PATH}" ;;
# esac

