export M3_HOME=$MARMALADE_ENVS/maven/default
export M3=$M3_HOME/bin
export MAVEN_OPTS="-Xmx8g"
add_to_end_of_path_if_not_exists $M3

################################################################################
# Marmalade Env Management
#
#
################################################################################
_marmalade_get_latest_version_number__maven() {
  curl -G -s -X GET 'https://search.maven.org/solrsearch/select' \
       --data-urlencode 'q=g:org.apache.maven AND a:maven' \
       --data-urlencode 'wt=json' \
       --data-urlencode 'start=0' \
       --data-urlencode 'rows=1' \
  | jq -r '.response.docs[0].latestVersion'
}

_marmalade_get_local_latest_version_number__maven() {
  ls -1 $MARMALADE_ENVS/maven/ | grep -v default | sort -V | tail -n 1
}

_marmalade_install__maven() {
  # $1: version e.g. 3.5.0
  curl -L --fail http://www-us.apache.org/dist/maven/maven-3/$1/binaries/apache-maven-$1-bin.tar.gz > /tmp/maven.tar.gz
  mkdir -p $MARMALADE_ENVS/maven/$1
  tar xf /tmp/maven.tar.gz --strip-components=1 -C $MARMALADE_ENVS/maven/$1
  rm /tmp/maven.tar.gz
}
