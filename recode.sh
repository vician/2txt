#!/bin/bash
which recode 1>/dev/null 2>/dev/null
if [ $? -ne 0 ]; then
  echo "ERROR: Program 'recode' isn't installed, please install it first!"
  echo "TIP: Package 'recode' on Fedora/CentOS by: yum/dnf install recode"
  echo "TIP: Package 'recode' on Debian/Ubuntu by: apt-get/aptitud install recode"
  exit 1;
fi

if [ $# -ne 2 ]; then
  echo "ERROR: $0 Wrong params!"
  echo "Run: $0 input_file"
  exit 1
fi

recode -v windows-1250..UTF-8 $1
