#!/usr/bin/env bash
# ./build.sh <src> <dst>

# Turn SRC and DST into absolute paths
SRC=`realpath "$1"`
DST=`realpath "$2"`

# Create header for file
printf "#!/usr/bin/env bash\n# AUTO-GENERATED FILE\n\n" > $DST

# Treat src/path.sh separately from all other soure files
# to load $PATH at the very beginning
cat "$SRC/path.sh" >> $DST

# Find all $SRC/**/*.sh files and append to $DST
for file in $(find "$SRC" -type f -name '*.sh' -and -not -path "$SRC/path.sh"); do
  printf "\n\n# $file:\n" >> "$DST"
  cat "$file" >> "$DST"
  printf "\n" >> "$DST"
done
