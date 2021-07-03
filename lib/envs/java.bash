alias java-ls='ll /etc/alternatives | grep /usr/lib/jvm | column -t'

if command -v java &> /dev/null; then
  export JAVA_HOME=$(path-abs $(path-real $(which java)))
  #add_to_path $JAVA_HOME/bin
fi
