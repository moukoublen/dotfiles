export M3_HOME=$DOTFILES_ENVS/maven/default
export M3=$M3_HOME/bin
export MAVEN_OPTS="-Xmx8g"
alias mvn-no-tests="mvn -Dmaven.test.skip=true -DskipTests=true"
add_to_path $M3 "after"

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
  ls -1 $DOTFILES_ENVS/maven/ | grep -v default | sort -V | tail -n 1
}

_marmalade_install__maven() {
  # $1: version e.g. 3.5.0
  curl --fail --silent --show-error --location https://downloads.apache.org/maven/maven-3/$1/binaries/apache-maven-$1-bin.tar.gz > /tmp/maven.tar.gz
  mkdir -p $DOTFILES_ENVS/maven/$1
  tar xf /tmp/maven.tar.gz --strip-components=1 -C $DOTFILES_ENVS/maven/$1
  rm /tmp/maven.tar.gz
}
