#!/usr/bin/env bash
#
# Script to build dotfiles from source
# ./build.sh <src> <dst>

# Set a clean PATH for this build script
PATH="/bin:/sbin:/usr/bin:/usr/sbin"

function abspath {
  /usr/bin/python -c 'import os, sys; print(os.path.abspath(sys.argv[1]))' "$1"
}

# Turn SRC and DST into absolute paths
SRC=`abspath "$1"`
DST=`abspath "$2"`

# Create header
printf "#!/usr/bin/env bash\n# AUTO-GENERATED FILE - Do not edit!\n\n" > $DST

# Set initial $PATH for dotfiles
printf 'export CLEAN_PATH="/bin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin"\n' >> $DST
printf 'export PATH="$CLEAN_PATH"\n' >> $DST
printf 'export SHIM_PATH=""\n' >> $DST

# Find all $SRC/**/*.sh files and append to $DST
for file in $(find "$SRC" -type f -name '*.sh'); do
  printf "\n\n# $file:\n" >> "$DST"
  cat "$file" >> "$DST"
  printf "\n" >> "$DST"
done

# Sanitize and secure $PATH
# 
# 1. Search in /bin and /sbin first. These are hard system binaries. Don't mess with them.
# 2. Next search in /usr/local/bin and /usr/local/sbin. This prioritizes Homebrew packages over MacOS packages.
# 3. /usr/local/bin/shims are "whitelisted" rbenv, goenv, pyenv, nodenv, and so on binaries which take precedence over MacOS preinstalled packages.
# 4. /usr/bin and /usr/sbin contain MacOS preinstalled binaries.
# 5. Lastly, search for rbenv, goenv, pyenv, nodenv, and so on binaries.
# 
# This search order prevents accidental usage of a `sudo` binary installed by node for example.
#
# What are "whitelisted" shims? What is in /usr/local/bin/shims?
#   /usr/bin has ruby and python binaries pre-installed. MacOS's System Integrity Protection
#   prevents changes to /usr/bin. In order for us to use rbenv's or pyenv's binaries,
#   we first search in /usr/local/bin/shims.
#   Run `shim_conflicts` to identify problematic /usr/bin binaries. Then update `$HOME/.shims` and run `reload_shims`.
#
printf '\n\nexport PATH="$(echo "/bin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/local/bin/shims:/usr/bin:/usr/sbin:$SHIM_PATH" | tr -s : | sed 's/:$//')"\n' >> $DST
