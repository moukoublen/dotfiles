if [ ! -d '/home/linuxbrew/.linuxbrew' ]; then
  return 0
fi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

if [ -d "${HOMEBREW_PREFIX}/etc/bash_completion.d" ]; then
  for rc in "${HOMEBREW_PREFIX}/etc/bash_completion.d"/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi

## macos

#if command -v brew 1>/dev/null 2>&1; then
if [[ -d /opt/homebrew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  #export HOMEBREW_PREFIX="/opt/homebrew"
  #export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
  #export HOMEBREW_REPOSITORY="/opt/homebrew"
  #export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}"
  #export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
  #export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"

  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    export BASH_COMPLETION_COMPAT_DIR="${HOMEBREW_PREFIX}/etc/bash_completion.d"
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  fi
fi
