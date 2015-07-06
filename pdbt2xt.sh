#!/bin/bash

which txt2pdbdoc 1>/dev/null 2>/dev/null
if [ $? -ne 0 ]; then
  echo "ERROR: Program 'txt2pdbdoc' isn't installed, please install it first!"
  echo "TIP: Package 'txt2pdbdoc' on Debian/Ubuntu by: apt-get/aptitude install txt2pdbdoc"
  exit 1;
fi

if [ $# -ne 2 ]; then
  echo "ERROR: $0 Wrong params!"
  echo "Run: $0 input_file output_file"
  exit 1
fi

INPUT=$1
OUTPUT=$2

if [ ! -f $INPUT ]; then
  echo "ERROR: Input file doesn't exist! ($INPUT)"
  exit 1
fi
if [ ! -r $INPUT ]; then
  echo "ERROR: Input file doesn't readable! ($INPUT)"
  exit 1
fi
txt2pdbdoc -d $1 > $2
if [ $? -ne 0 ]; then
  echo "ERROR: Converting failed!"
  exit 1
fi
echo "Converting sucesfull!"
