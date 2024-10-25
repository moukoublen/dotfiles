path-add() {
  if [[ ${1} == "" ]]; then
    return
  fi

  if [[ ":${PATH}:" != *":${1}:"* ]]; then
    if [[ ${2} == "after" ]]; then
      PATH=${PATH}:${1}
    else
      PATH=${1}:${PATH}
    fi
  fi

  export PATH
}
