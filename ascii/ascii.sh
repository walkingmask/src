#!/usr/bin/env bash
set -eu -o pipefail

# ascii
# created at 2017/07/15 (Mon)
# walkingmask
# Show ASCII table

function ascii(){
  if [ $# -eq 0 ]; then
    echo "Usage: ascii [-o|-x|-d [char]]"
    cat /usr/share/misc/ascii | awk 'BEGIN { RS = "" ; FS = "\n"};NR == 3'
  elif [ $# -eq 1 ]; then
    case "$1" in
      "-o" ) cat /usr/share/misc/ascii | awk 'BEGIN { RS = "" ; FS = "\n"};NR == 1' ;;
      "-x" ) cat /usr/share/misc/ascii | awk 'BEGIN { RS = "" ; FS = "\n"};NR == 2' ;;
      "-d" ) cat /usr/share/misc/ascii | awk 'BEGIN { RS = "" ; FS = "\n"};NR == 3' ;;
      * ) echo "Usage: ascii [-o|-x|-d [char]]" && exit 1 ;;
    esac
  else
    case "$1" in
      "-o" ) printf "%o\n" \'$2 ;;
      "-x" ) printf "%x\n" \'$2 ;;
      "-d" ) printf "%d\n" \'$2 ;;
      * ) echo "Usage: ascii [-o|-x|-d [char]]" && exit 1 ;;
    esac
  fi
}

ascii $@
