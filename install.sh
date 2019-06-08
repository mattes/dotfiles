for path in $(cd home && find . -type f -not -path './bash/*'); do
  file=/home/$(whoami)/.${path:2}
  dir=$(dirname $file)
  relative=$(realpath --relative-to $(realpath /home/$(whoami)/dotfiles/home/$path) /home/$(whoami)/dotfiles/home)
  symlink=${relative:0:-2}dotfiles/home/${path:2}

  if [[ ! -e "$dir" ]]; then
    mkdir -p "$dir"
  fi

  rm $file 2>/dev/null
  ln --force -s "$symlink" "$file"
done

