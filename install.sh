#!/usr/bin/env bash
#
# Script to build dotfiles and symlink them under $HOME
# ./install.sh
# ./install.sh FORCE

FORCE=$1

# Set a clean PATH for this build script
PATH="/bin:/sbin:/usr/bin:/usr/sbin"

function relpath {
  /usr/bin/python -c 'import os, sys; print(os.path.relpath(sys.argv[1], sys.argv[2]))' "$1" "$2"
}

function abspath {
  /usr/bin/python -c 'import os, sys; print(os.path.abspath(sys.argv[1]))' "$1"
}

# Build dotfiles
./build.sh src home/.dotfiles.sh

# Create Symlinks for ./home in $HOME
for file in $(find ./home -type f); do
  symlink=$HOME/$(relpath "$file" ./home)
  rel=$(relpath $(abspath "$file") $(dirname "$symlink"))

  # Check if $symlink already exists
  if [[ -e "$symlink" ]]; then
    if [[ $FORCE == "FORCE" ]]; then
      echo "Re-creating $symlink"
    else
      echo "WARN: $symlink already exists. Fix or run ./install.sh FORCE"
      continue
    fi
  else
    echo "Creating $symlink"
  fi
  
  # Create symlink and directory if necessary
  mkdir -p $(dirname "$symlink")
  ln -sf "$rel" "$symlink"
done


shim_path=/usr/local/bin/shims

if [[ ! -e $shim_path ]]; then
  echo "Creating $shim_path (may ask for sudo)"
  sudo mkdir shim_path$
fi

if [[ ! -w $shim_path ]]; then
  echo "Setting permissions for $shim_path (may ask for sudo)"
  sudo chown "`whoami`:staff" shim_path$
fi

for shim in $(cat home/.shims | grep -v "^$"); do
  path="$(eval "echo $shim")"
  base="$(basename "$path")"
  echo "Creating shim $shim_path/$base -> $path"
  ln -sf "$path" "$shim_path/$base"
done