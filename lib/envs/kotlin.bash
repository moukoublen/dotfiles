#add_to_path $MARMALADE_ENVS/kotlin/default/bin "after"

################################################################################
# Marmalade Env Management
################################################################################
_marmalade_get_latest_version_number__kotlin() {
  curl -s https://api.github.com/repos/JetBrains/kotlin/releases/latest | jq -r '.tag_name' | tr -d 'v'
}

_marmalade_get_local_latest_version_number__kotlin() {
  ls -1 $MARMALADE_ENVS/kotlin/ | grep -v default | sort -V | tail -n 1
}

_marmalade_install__kotlin() {
  # $1: version e.g. 4.1
  # https://github.com/JetBrains/kotlin/releases/download/v1.1.51/kotlin-compiler-1.1.51.zip
  #
  local url="https://github.com/JetBrains/kotlin/releases/download/v$1/kotlin-compiler-$1.zip"
  echo "    Download $url"
  curl -L --fail $url > /tmp/kotlin.zip
  mkdir -p $MARMALADE_ENVS/kotlin/$1
  unzip -qq /tmp/kotlin.zip -d /tmp/
  mv /tmp/kotlinc/* $MARMALADE_ENVS/kotlin/$1
  rm /tmp/kotlin.zip
  rm -rf /tmp/kotlinc
}
