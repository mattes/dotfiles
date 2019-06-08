#!/bin/bash

out="cached.sh"

# Delete file first
rm -f $out

# add prefix
printf "# AUTO GENERATED FILE - DO NOT CHANGE\n" > $out
printf "# Change files in src directory instead.\n\n\n" >> $out

# add src/path.sh first
cat src/path.sh >> $out
printf "\n" >> $out

dirs=( "src/functions" "src/aliases" "src/env" )
for dir in "${dirs[@]}"; do
  for file in $dir/*.sh; do 
    printf "\n# $(basename $file)\n" >> $out
    cat $file  >> $out
    printf "\n" >> $out
  done 
done

