# https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating

# https://github.com/nvm-sh/nvm?tab=readme-ov-file#usage-1
# usage
# alias               deactivate          install             list-remote         reinstall-packages  uninstall           version
# cache               exec                install-latest-npm  ls                  run                 unload              version-remote
# current             help                list                ls-remote           unalias             use                 which
#
# nvm install 'lts/jod'
# nvm install --lts                     Install the latest LTS version
# nvm alias default node                Always default to the latest available node version on a shell
# nvm alias default lts/jod
## to "upgrade"
# nvm install lts/jod --reinstall-packages-from=v22.14.0
## or
# nvm install node --reinstall-packages-from=node
export NVM_DIR="${HOME}/.nvm"

[ -s "${NVM_DIR}/nvm.sh" ] && source "${NVM_DIR}/nvm.sh"
[ -s "${NVM_DIR}/bash_completion" ] && source "${NVM_DIR}/bash_completion"

install-nvm() {(
  mkdir -p "${NVM_DIR}"
  git clone https://github.com/nvm-sh/nvm.git "${NVM_DIR}"
  cd "${NVM_DIR}"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
)}

update-nvm() {(
  cd "${NVM_DIR}"
  git fetch --tags origin
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
)}

# npm install --global corepack@latest
# npm install -g @anthropic-ai/claude-code
# npm list -g
# npm update -g

# corepack enable pnpm
