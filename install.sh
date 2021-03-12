#!/usr/bin/env bash

FORCE=$1

# Build dotfiles
./build.sh src home/.dotfiles.sh

# Create Symlinks for ./home in $HOME
for file in $(find ./home -type f); do
  symlink=$HOME/$(realpath --relative-to ./home "$file")
  rel=$(realpath --relative-to $(dirname "$symlink") $(realpath "$file"))

  # Check if $symlink already exists
  if [[ -e "$symlink" ]]; then
    if [[ $FORCE == "FORCE" ]]; then
      echo "Creating $symlink (forced)"
    else
      echo "Error: $symlink already exists. Fix or run ./install.sh FORCE"
      continue
    fi
  else
    echo "Creating $symlink"
  fi
  
  # Create symlink and directory if necessary
  mkdir -p $(dirname "$symlink")
  ln -sf "$rel" "$symlink"
done
