add_to_path () {
  if [[ "$1" == "" ]]; then
    return
  fi
  if [[ ":$PATH:" != *":$1:"* ]] ; then
    if [[ "$2" = "after" ]] ; then
      PATH=$PATH:$1
    else
      PATH=$1:$PATH
    fi
  fi
}

add_to_start_of_path_if_not_exists() {
  add_to_path $1
  export PATH;
}

add_to_end_of_path_if_not_exists() {
  add_to_path $1 "after"
  export PATH;
}

load_path_file_to_path() {
  if [ -f ~/.path ]; then
    while read p; do
      p=$(eval echo \"$p\")
      add_to_end_of_path_if_not_exists $p
    done < ~/.path
    unset p
  fi
}
