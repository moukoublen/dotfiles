case "$(uname)" in

  "Darwin")
    if [[ ! -d '/opt/homebrew' ]]; then
    return 0
    fi
    eval "$(/opt/homebrew/bin/brew shellenv)"

    if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
      export BASH_COMPLETION_COMPAT_DIR="${HOMEBREW_PREFIX}/etc/bash_completion.d"
      source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
    fi
    ;;

  "Linux")
    if [ ! -d '/home/linuxbrew/.linuxbrew' ]; then
      return 0
    fi
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

    if [ -d "${HOMEBREW_PREFIX}/etc/bash_completion.d" ]; then
      for rc in "${HOMEBREW_PREFIX}/etc/bash_completion.d"/*; do
        if [ -f "${rc}" ]; then
          source "${rc}"
        fi
      done
    fi
    unset rc
    ;;

esac
