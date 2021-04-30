function list_shims {
  shim_paths=${SHIM_PATH//:/ }
  for shim_path in $shim_paths; do
    for shim in ${shim_path}/*; do
      # if shim is executable
      if [[ -f $shim && -x $shim ]]; then
        echo $shim
      fi
    done
  done
}

function shim_conflicts {
  clean_paths=${CLEAN_PATH//:/ }
  for shim_path in `list_shims`; do
    shim=$(basename $shim_path)
    for clean_path in $clean_paths; do
      if [[ -f "$clean_path/$shim" ]]; then
        if [[ ! -f "/usr/local/bin/shims/$shim" ]]; then
          echo "$clean_path/$shim overrides $shim_path"
        fi
      fi
    done
  done
}

function reload_shims {
  shim_path=/usr/local/bin/shims
  for shim in $(cat $HOME/.shims | grep -v "^$"); do
    path="$(eval "echo $shim")"
    base="$(basename "$path")"
    echo "Creating shim $shim_path/$base -> $path"
    ln -sf "$path" "$shim_path/$base"
  done
}