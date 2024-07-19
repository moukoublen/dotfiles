ww() {
  if ! type -t "${1}" &> /dev/null; then
    echo -e "\e[0;31mNot found\e[0m"
    return
  fi

  local cat_cmd
  cat_cmd="source-highlight --line-number=0 --no-doc --out-format=esc --tab=2"

  local type_of
  type_of="$(type -t "${1}")"
  if [[ "${type_of}" == 'function' ]]; then
    declare -f "${1}" | ${cat_cmd} --src-lang=shell
    return
  fi
  if [[ "${type_of}" == 'alias' ]]; then
    alias "${1}" | ${cat_cmd}
    return
  fi

  local full_path
  full_path="$(which "${1}")"
  local file_of
  file_of="$(file "${full_path}")"
  if [[ "${file_of}" == *text* ]]; then
    ${cat_cmd} --infer-lang --input="${full_path}"
    return
  fi

  if [[ "${file_of}" == *symbolic\ link* ]]; then
    echo -e "\e[0;37mFile:\e[0m \e[0;36m${full_path}\e[0m \e[0;90m${file_of}\e[0m "
  fi

  case "$(uname)" in
    "Darwin")
      full_path="$(realpath "${full_path}")"
      ;;
    "Linux")
      full_path="$(realpath --logical "${full_path}")"
      ;;
  esac

  file_of="$(file "${full_path}")"
  if [[ "${file_of}" == *text* ]]; then
    ${cat_cmd} --infer-lang --input="${full_path}"
    return
  fi

  echo -e "\e[0;37mFile:\e[0m \e[0;36m${full_path}\e[0m \e[0;90m${file_of}\e[0m "
}
export -f ww
complete -c ww