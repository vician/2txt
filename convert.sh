#!/bin/bash

###
which dirname 1>/dev/null 2>/dev/null
if [ $? -ne 0 ]; then
  echo "ERROR: Program 'dirname' isn't installed, please install it first!"
  echo "TIP: Package 'coreutils' on Fedora/CentOS by: yum/dnf install coreutils"
  echo "TIP: Package 'coreutils' on Debian/Ubuntu by: apt-get/aptitude install coreutils"
  exit 1;
fi
which basename 1>/dev/null 2>/dev/null
if [ $? -ne 0 ]; then
  echo "ERROR: Program 'basename' isn't installed, please install it first!"
  echo "TIP: Package 'coreutils' on Fedora/CentOS by: yum/dnf install coreutils"
  echo "TIP: Package 'coreutils' on Debian/Ubuntu by: apt-get/aptitude install coreutils"
  exit 1;
fi

### Constants ###

readonly BASE_DIR="`dirname $0`"
readonly RUN_ENV="bash"
readonly DOC2TXT="$BASE_DIR/doc2txt.sh"
readonly PDB2TXT="$BASE_DIR/pdb2txt.sh"
readonly RECODE="$BASE_DIR/recode.sh"

### Variables ###

INPUT_DIR="$BASE_DIR/input/"
OUTPUT_DIR="$BASE_DIR/output/"
DONE_DIR="$BASE_DIR/done/"

### Functions ###

### MAIN ###

files=( $INPUT_DIR* )

echo "Loaded ${#files[@]}"

for file in "${files[@]}"; do
  echo "- $file"
  file_base="`basename "$file"`"
  file_name="${file_base%.*}"
  file_ext="${file_base##*.}"
  echo "=> $file_name ($file_ext)"
  file_out="${OUTPUT_DIR}$file_name.txt"
  if [ "$file_ext" == "pdb" ]; then
    $PDB2TXT "$file" "$file_out" && mv "$file" "$DONE_DIR"
  elif [ "$file_ext" == "doc" ] || [ "$file_ext" == "rtf" ]; then
    $DOC2TXT "$file" "$file_out" && mv "$file" "$DONE_DIR"
  fi
done
