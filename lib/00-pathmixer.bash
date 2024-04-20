path-add() {
  if [[ "${1}" == "" ]]; then
    return
  fi

  if [[ ":${PATH}:" != *":${1}:"* ]] ; then
    if [[ "${2}" = "after" ]] ; then
      PATH=${PATH}:${1}
    else
      PATH=${1}:${PATH}
    fi
  fi

  export PATH;
}

load-path-file() {
  if [ -f ~/.path ]; then
    while read p; do
      [[ ${p} = "" ]] && continue
      p=$(eval echo \"${p}\")
      path-add ${p}
    done < ~/.path
    unset p
  fi
}
