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

BASH_FILE=~/.bashrc
[[ ! -f $BASH_FILE ]] && BASH_FILE=~/.bash_profile
[[ ! -f $BASH_FILE ]] && touch $BASH_FILE
echo "  file to be used: $BASH_FILE"

SOURCE_LINE='[[ -r ~/.marmalade.sh ]] && [[ -f ~/.marmalade.sh ]] && source ~/.marmalade.sh'
if grep --fixed-strings -q "$SOURCE_LINE" $BASH_FILE; then
  echo "  marmalade sourcing is already included in $BASH_FILE"
else
  echo "  add marmalade sourcing in $BASH_FILE"
  echo $SOURCE_LINE >> $BASH_FILE
fi

echo "********************************************************"
echo "********************************************************"
