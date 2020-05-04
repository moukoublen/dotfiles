if [ -d /usr/lib/jvm/java ] # fedora openjdk
then
  export JAVA_HOME=/usr/lib/jvm/java
elif [ -d /usr/lib/jvm/default-java ] # ubuntu openjdk
then
  export JAVA_HOME=/usr/lib/jvm/default-java
elif [ -d $MARMALADE_ENVS/java/default ] # oracle
then
  export JAVA_HOME=$MARMALADE_ENVS/java/default
  add_to_start_of_path_if_not_exists $JAVA_HOME/bin
fi

set_java_home() {
  export JAVA_HOME=$1
  add_to_start_of_path_if_not_exists $JAVA_HOME/bin
}
#export IDEA_JDK=$JAVA_HOME
#export STUDIO_JDK=$JAVA_HOME
#export CL_JDK=$JAVA_HOME
