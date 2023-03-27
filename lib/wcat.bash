__wcat() {
  if [[ "$(type -t ${1})" == 'function' ]]; then
    declare -f "${1}"
    return
  fi
  if [[ "$(type -t ${1})" == 'alias' ]]; then
    alias "${1}"
    return
  fi
  local fl=$(which $1)

  echo -e "\e[0;90m============================================================\e[0m"
  echo -e "\e[0;37mfile:\e[0m \e[0;36m${fl}\e[0m"
  echo -e "\e[0;90m============================================================\e[0m"
  cat "${fl}"
  echo -e "\e[0;90m============================================================\e[0m"
}

wcat() {
  local cat_cmd
  cat_cmd=$(which bat)
  if [[ "${cat_cmd}" == "" ]]; then
    __wcat "${1}"
    return
  fi

  cat_cmd="${cat_cmd} --paging=never --style=plain,header --wrap=never --theme=Nord"

  if [[ "$(type -t ${1})" == 'function' ]]; then
    declare -f "${1}" | ${cat_cmd} --language=bash --file-name="${1}"
    return
  fi
  if [[ "$(type -t ${1})" == 'alias' ]]; then
    alias "${1}" | ${cat_cmd} --language=bash --file-name="${1}"
    return
  fi

  ${cat_cmd} "$(which $1)"
}
complete -c wcat
