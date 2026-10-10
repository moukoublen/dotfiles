case "$(uname -s)" in
  Darwin)
    [[ -x /opt/homebrew/bin/brew ]] || return 0
    eval "$(/opt/homebrew/bin/brew shellenv)"

    completion="${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
    if [[ -r ${completion} ]]; then
      export BASH_COMPLETION_COMPAT_DIR="${HOMEBREW_PREFIX}/etc/bash_completion.d"

      # shellcheck source=/dev/null
      source "${completion}"
    fi
    unset completion
    ;;

  *) ;;
esac
