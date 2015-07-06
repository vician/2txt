#!/bin/bash

which catdoc 1>/dev/null 2>/dev/null
if [ $? -ne 0 ]; then
  echo "ERROR: Program 'catdoc' isn't installed, please install it first!"
  echo "TIP: Package 'catdoc' on Fedora/CentOS by: yum/dnf install catdoc"
  echo "TIP: Package 'catdoc' on Debian/Ubuntu by: apt-get/aptitud install catdoc"
  exit 1;
fi

if [ $# -ne 2 ]; then
  echo "ERROR: $0 Wrong params!"
  echo "Run: $0 input_file output_file"
  exit 1
fi

INPUT=$1
OUTPUT=$2

if [ ! -f "$INPUT" ]; then
  echo "ERROR: Input file doesn't exist! ($INPUT)"
  exit 1
fi
if [ ! -r "$INPUT" ]; then
  echo "ERROR: Input file doesn't readable! ($INPUT)"
  exit 1
fi
echo "catdoc -w $INPUT > $OUTPUT"
catdoc -w "$INPUT" > "$OUTPUT"
if [ $? -ne 0 ]; then
  echo "ERROR: Converting failed!"
  exit 1
fi
echo "Converting sucesfull!"
