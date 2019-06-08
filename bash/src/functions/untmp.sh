function untmp {
  tmp_path=$(pwd)
  tmp_dirname=$(basename $tmp_path)
  timestamp=$(date +%s)

  if [[ ! -d "$HOME/tmp/" ]]; then
    mkdir "$HOME/tmp/"
  fi

  if [[ $tmp_path == /tmp/* ]]; then
    mv "$tmp_path" "$HOME/tmp/$tmp_dirname-$timestamp"
    cd "$HOME/tmp/$tmp_dirname-$timestamp"
  fi
}
