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

