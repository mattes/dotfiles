#!/usr/bin/env bash
SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# build cached files
# ./build-cache.sh 

PLATTFORMS=( "linux" "darwin" )

function cache {
  plattform=$1
  cache_file="$SCRIPT_PATH/cached.$plattform.sh"

  # delete old file
  rm -f $cache_file

  # add path file at the very beginning
  cat $SCRIPT_PATH/src/path.sh >> $cache_file
  printf "\n" >> $cache_file

  # build expressions for generic plattform files
  # exclude all plattforms first
  expressions=""
  for _plattform in "${PLATTFORMS[@]}"; do 
    expressions+="-not -name \"*$_plattform*\" "
  done


  dirs=( "$SCRIPT_PATH/src/functions" "$SCRIPT_PATH/src/aliases" "$SCRIPT_PATH/src/env" )
  for dir in "${dirs[@]}"; do
    # get generic plattform files
    for file in $(eval find $dir -type file $expressions -not -name \"*sample.sh\"); do
      cat $file  >> $cache_file
      printf "\n" >> $cache_file
    done 

    # get specifiy plattform files
    for file in $(find $dir -type file -name "*.$plattform.sh" -not -name \"*sample.sh\"); do
      cat $file >> $cache_file
      printf "\n" >> $cache_file
    done
  done
}

cache "darwin"
cache "linux"
