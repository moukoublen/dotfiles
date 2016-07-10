function add_to_start_of_path_if_not_exists ()
{
  [[ ":$PATH:" != *":$1:"* ]] && PATH="${1}:${PATH}"
  export PATH;
}

function add_to_end_of_path_if_not_exists ()
{
  [[ ":$PATH:" != *":$1:"* ]] && PATH="${PATH}:${1}"
  export PATH;
}

if [ -f ~/.path ]; then
  while read p; do
    p=$(eval echo \"$p\")
    add_to_end_of_path_if_not_exists $p
  done < ~/.path
  unset p
fi
