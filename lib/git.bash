if command -v gh 1>/dev/null 2>&1; then
  source <(gh completion --shell bash)
fi

alias gcl='git config --local --list'
