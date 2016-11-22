#!/usr/bin/env bash
SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function exist {
  # -e checks if file is link or symlink
  # -e returns false if symlink is broken (but exists)
  # -L returns true even if symlink is broken
  # -d returns true if it is a directory
  if [[ -e $1 || -L $1 || -d $1 ]]; then 
    return 1
  else
    return 0
  fi    
}

case $1 in
  "install" )
    echo "Installing Dotfiles ..."

    if exist /etc/profile; then
      echo "Warning: /etc/profile exists! Do not export any PATH variable in this file!"
    fi

    if exist $HOME/.bash_login; then
      echo "Info: $HOME/.bash_login exists."
    fi

    if exist $HOME/.profile; then
      echo "Info: $HOME/.profile exists."
    fi

    if exist $HOME/.bash_logout; then
      echo "Info: $HOME/.bash_logout exists."
    fi

    timestamp=$(date +%s)

    # link everything under ./home/* to $HOME/*
    for path in $SCRIPT_PATH/home/*; do
      # path ./home/xyz
      file=$(basename $path) # xyz
      home_path="$HOME/.$file" # /Users/mattes/.xyz

      # file or dir exists?
      if eval$(exist $home_path); then
        # create backup
        echo "Backup: $home_path.$timestamp.backup"
        mv "$home_path" "$home_path.$timestamp.backup"
      fi

      ln -s $path $home_path
      echo "Symlink: $home_path -> $path"
    done

    # add .localrc
    if ! exist $HOME/.localrc; then
      touch $HOME/.localrc
    fi

    # restart shell
    exec $SHELL -l

    echo "Done."
    ;;

  "uninstall" )
    echo "Uninstalling Dotfiles ..."
    for path in $SCRIPT_PATH/home/*; do
      file=$(basename $path)
      (cd $HOME && rm -f ".$file")      
    done
    echo "Done."
    ;;

  "delete-backups" )
    echo "Deleting Backups ..."
    for path in $SCRIPT_PATH/home/*; do
      file=$(basename $path)
      (cd $HOME && eval rm -f ".$file.*.backup")      
    done
    echo "Done."
    ;;
esac
