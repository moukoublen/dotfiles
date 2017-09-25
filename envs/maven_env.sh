export M3_HOME=$MARMALADE_ENVS/maven/default
export M3=$M3_HOME/bin
export MAVEN_OPTS="-Xmx2048m -Xms256m"
add_to_end_of_path_if_not_exists $M3
