path-add() {
  if [[ ${1} == "" ]]; then
    return
  fi

  if [[ ":${PATH}:" == *":${1}:"* ]]; then
    return
  fi

  # By default the path is prepended (added first); pass "after" as the
  # second argument to append it (added last) instead.
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
