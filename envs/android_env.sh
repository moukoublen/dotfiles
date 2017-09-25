export ANDR_PT="$HOME/Android/Sdk/platform-tools"
android_to_path() {
  add_to_start_of_path_if_not_exists $ANDR_PT
}
