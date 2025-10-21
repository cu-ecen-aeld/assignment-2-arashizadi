#!/bin/sh

show_help() {
  echo "Usage: $0 <writefile> <writestr>"
  echo "\nArgs:"
  echo "  writefile:  Path to a file which needs to be written to"
  echo "  writestr:  String content to be written in the given file"
  echo "\nExamples:\n$0 ./src.txt hi\nThis would create or overrite the ./src.txt file with \"hi\" as its content"
}

validate_input() {
  if [ "$#" -eq 1 ] && { [ "$1" = "-h" ] || [ "$1" = "--help" ]; }; then
    show_help
    exit 0
  fi
  
  if [ "$#" -ne 2 ]; then
    echo "Error: Need 2 arguments, but $# arguments was given."
    show_help
    exit 1
  fi

  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Error: Both arguments must be non-empty."
    show_help
    exit 1
  fi
}

check_ok_status() {
  if [ $? -ne 0 ]; then
    echo "Error: something were wrong."
    exit $?
  fi
}

validate_input "$@"

writefile=$1
writestr=$2

dirpath=$(dirname "$writefile")
if [ ! -d "$dirpath" ]; then
  mkdir -p "$dirpath"
  check_ok_status
fi

echo $writestr > $writefile

check_ok_status
exit 0
