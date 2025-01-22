#!/bin/bash

# Example conditionals / usage
#SEARCHPATH="$1"
#
#if [ $# -ne 1 -o ! -d "$SEARCHPATH" ]
#then
#  echo "Usage: $(basename $0) /path/to/blobfiles"
#  exit 1
#fi

 
BASEDIR="$(realpath "$(dirname "$0")/..")"
TMPDIR=$(mktemp -d -t $(basename "$0" | sed -e 's/\.sh$//').XXXXXXXXXX)

cleanup() {
  rm -rf $TMPDIR
}
trap cleanup EXIT

log() {
  echo "$(date +"%F %r") - $@"
}

logheading() {
  hbar="$(sed -e 's/./═/g' <<< "$@")"
  echo "╔══${hbar}═╗"
  echo "$@" | while read line
  do
    echo "║ ${line}$(printf '%*.*s' 0 $((length - ${#line} )) ' ') ║"
  done
  echo "╚══${hbar}═╝"
}

log Staring script

logheading What do we have here

log Ending Script
