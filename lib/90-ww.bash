# sudo dnf install highlight # https://gitlab.com/saalen/highlight
# https://github.com/sharkdp/bat
# https://github.com/alecthomas/chroma

ww() {
  if ! type -t "${1}" &>/dev/null; then
    echo -e "\e[0;31mNot found\e[0m"
    return
  fi

  local cat_cmd
  cat_cmd='bat --theme=auto --unbuffered --paging=never --style=plain'

  local type_of
  type_of="$(type -t "${1}")"
  if [[ ${type_of} == 'function' ]]; then
    declare -f "${1}" | ${cat_cmd} --language=sh
    return
  fi
  if [[ ${type_of} == 'alias' ]]; then
    alias "${1}" | ${cat_cmd} --language=sh
    return
  fi

  local full_path
  full_path="$(which "${1}")"
  local file_of
  file_of="$(file "${full_path}")"
  if [[ ${file_of} == *text* ]]; then
    echo -e "\e[0;37mFile:\e[0m \e[0;36m${full_path}\e[0m \e[0;90m${file_of}\e[0m "
    echo ''
    ${cat_cmd} "${full_path}" 2>/dev/null || ${cat_cmd} --language=sh "${full_path}"
    return
  fi

  while [[ -L ${full_path} ]]; do
    local target
    # resolve symlink's source
    case "$(uname)" in
      "Darwin")
        target="$(realpath "${full_path}")"
        ;;
      "Linux")
        target="$(realpath --logical "${full_path}")"
        ;;
      *)
        target="$(realpath "${full_path}")"
        ;;
    esac

    echo -e "\e[0;37mFile:\e[0m \e[0;36m${full_path}\e[0m -> \e[0;96m${target}\e[0m"

    if [[ ${target} == /* ]]; then
      # Absolute path
      full_path="${target}"
    else
      # Relative path
      dir=$(dirname "${target}")
      full_path="${dir}/${target}"
    fi
  done

  file_of="$(file "${full_path}")"
  echo -e "\e[0;37mFile:\e[0m \e[0;36m${full_path}\e[0m \e[0;90m${file_of}\e[0m "

  if [[ ${file_of} == *text* ]]; then
    ${cat_cmd} "${full_path}" 2>/dev/null || ${cat_cmd} --language=sh "${full_path}"
  fi
}
export -f ww
complete -c ww

bb() {
  local cat_cmd='bat --theme=auto --unbuffered --paging=never --style=plain'
  ${cat_cmd} "${@}" 2>/dev/null || ${cat_cmd} --language=sh "${@}"
}
