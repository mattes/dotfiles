function untmp {
  tmp_path=$(pwd)
  tmp_dirname=$(basename $tmp_path)
  timestamp=$(date +%s)

  if [[ ! -d "$DEVELOPER_PATH/tmp/" ]]; then
    mkdir "$DEVELOPER_PATH/tmp/"
  fi

  if [[ $tmp_path == /tmp/* ]]; then
    mv "$tmp_path" "$DEVELOPER_PATH/tmp/$tmp_dirname-$timestamp"
    cd "$DEVELOPER_PATH/tmp/$tmp_dirname-$timestamp"
  fi
}