init-linuxbrew() {
  [[ ! -d '/home/linuxbrew/.linuxbrew' ]] && return 0

  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
  if [ -d "${HOMEBREW_PREFIX}/etc/bash_completion.d" ]; then
    for rc in "${HOMEBREW_PREFIX}/etc/bash_completion.d"/*; do
      if [ -f "${rc}" ]; then
        # https://www.shellcheck.net/wiki/SC1090
        # shellcheck source=/dev/null
        source "${rc}"
      fi
    done
  fi
  unset rc
}

case "$(uname)" in

  "Darwin")
    [[ ! -d '/opt/homebrew' ]] && return 0
    eval "$(/opt/homebrew/bin/brew shellenv)"

    if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
      export BASH_COMPLETION_COMPAT_DIR="${HOMEBREW_PREFIX}/etc/bash_completion.d"
      # https://www.shellcheck.net/wiki/SC1090
      # shellcheck source=/dev/null
      source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
    fi
    ;;

  "Linux")
    [[ ${__DISABLE_LINUXBREW} == 'true' ]] && return 0
    init-linuxbrew
    ;;

  *) ;;
esac
