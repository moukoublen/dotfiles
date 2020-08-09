if command -v java &> /dev/null
then
    export JAVA_HOME=$(path-abs $(path-real $(which java)))
    add_to_start_of_path_if_not_exists $JAVA_HOME/bin
fi

set_java_home() {
  export JAVA_HOME=$1
  add_to_start_of_path_if_not_exists $JAVA_HOME/bin
}
#export IDEA_JDK=$JAVA_HOME
#export STUDIO_JDK=$JAVA_HOME
#export CL_JDK=$JAVA_HOME
