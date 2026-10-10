# Omit on non interactive.
case $- in
  *i*) ;;
  *) return ;;
esac

path-abs() {
  cd -P "$(dirname "${1}")" && pwd
}

path-read-link() {
  case "$(uname)" in
    "Darwin")
      readlink -n "${1}"
      ;;
    "Linux")
      readlink --canonicalize-existing --no-newline "${1}"
      ;;
    *)
      readlink -n "${1}"
      ;;
  esac
}

path-real() {
  local SOURCE="${1}"
  while [[ -L ${SOURCE} ]]; do
    SOURCE="$(path-read-link "${SOURCE}")"
    [[ ${SOURCE} != /* ]] && SOURCE="$(path-abs "${SOURCE}")/${SOURCE}"
  done
  path-abs "${SOURCE}"
}

DOTFILES_PATH="$(path-real "${BASH_SOURCE[0]}")"
export DOTFILES_PATH

################################################################################
######### Source libs ##########################################################
for src in "${DOTFILES_PATH}"/lib/*.bash; do
  [[ -f ${src} && -r ${src} ]] || continue

  # shellcheck source=/dev/null
  source "${src}"
done
unset src

for src in "${DOTFILES_PATH}"/extras-*; do
  [[ -f ${src} && -r ${src} ]] || continue

  # https://www.shellcheck.net/wiki/SC1090
  # shellcheck source=/dev/null
  source "${src}"
done 2>/dev/null
unset src

for src in "${HOME}/.bashrc.d/"*; do
  [[ -f ${src} && -r ${src} ]] || continue

  # shellcheck source=/dev/null
  source "${src}"
done
unset src
################################################################################
################################################################################
