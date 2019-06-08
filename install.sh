for path in $(find . -type f -not -path './bash/*' -not -path '*DS_Store'); do
  file=/home/$(whoami)/.${path:2}
  dir=$(dirname $file)
  relative=$(realpath --relative-to $(realpath /home/$(whoami)/dotfiles/$path) /home/$(whoami)/dotfiles)
  symlink=${relative:0:-2}dotfiles/${path:2}

  if [[ ! -e "$dir" ]]; then
    mkdir -p "$dir"
  fi

  rm $file || true > /dev/null
  ln --force -s "$symlink" "$file"
done

