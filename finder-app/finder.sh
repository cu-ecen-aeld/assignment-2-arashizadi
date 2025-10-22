#!/bin/sh

show_help() {
  echo "Usage: $0 <filesdir> <searchstr>"
  echo "\nArgs:"
  echo "  filedir:  Directory and its child directories to search"
  echo "  searchdir:  Keyword to search for in files within the given directory path"
  echo "\nExamples:\n$0 ./src hi\nThis would search ./src dir and its children for phase \"hi\""
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

  if [ ! -d "$1" ]; then
    echo "Error: '$1' is not a valid directory path."
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
filesdir=$1
searchstr=$2


X=$(find "$filesdir" -type f | wc -l | awk '{print $1}')
check_ok_status
Y=$(grep -R -- "$searchstr" "$filesdir" 2>/dev/null | wc -l)
check_ok_status

echo "The number of files are $X and the number of matching lines are $Y"
check_ok_status
exit 0
