#!/usr/bin/env bash

#lovely stackoverflow https://stackoverflow.com/questions/59895/getting-the-source-directory-of-a-bash-script-from-within
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

echo "********************************************************"
echo "**************** Marmalade Installation ****************"
echo "  marmalade folder: $DIR"

if [ ! -f ~/.marmalade.sh ]; then
  echo "  create symlink of marmalade.sh at home folder"
  ln -s $DIR/marmalade.sh ~/.marmalade.sh
else
  echo "  marmalade syslink exists"
fi

if [ -f ~/.bashrc ]; then
  if grep -q "\[\[ -r ~\/.marmalade.sh \]\] && \[\[ -f ~\/.marmalade.sh \]\] && source ~/.marmalade.sh" ~/.bashrc; then
    echo "  marmalade sourcing is already included in ~/.bashrc"
  else
    echo "  add marmalade sourcing in ~/.bashrc"
    echo "[[ -r ~/.marmalade.sh ]] && [[ -f ~/.marmalade.sh ]] && source ~/.marmalade.sh" >> .bashrc
  fi
else
  echo "  ERROR: ~/.bashrc does not exists. add the below line to bash profile script"
  echo "    [[ -r ~/.marmalade.sh ]] && [[ -f ~/.marmalade.sh ]] && source ~/.marmalade.sh"
fi

echo "********************************************************"
echo "********************************************************"
