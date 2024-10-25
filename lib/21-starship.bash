if command -v starship &>/dev/null; then
  export STARSHIP_CONFIG="${DOTFILES_PATH}/config/starship/starship.toml"
  eval "$(starship init bash)"
fi
