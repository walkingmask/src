#!/bin/sh
set -e

# gsou
# updated at 2021/05/16 (Sun)
# created at 2016/01/19 (Tue)
# walkingmask
# generate source code templates

# path to templates
tempath="$HOME/.gsou/template"
# registered extensions
opts="-c,-go,-html,-java,-pl,-py,-sh"

function usage() {
  echo "Usage: gsou -{c|go|html|java|pl|py|sh} filename" 2>&1
  exit 1
}

# exception handling
if [ $# -eq 2 ]; then
  [[ $opts =~ $1 ]] || usage
  # get extension
  ext=${1:1}
  # filename, date, name
  fn="$2.$ext"
  td="`date +%Y\\\\/%m\\\\/%d`(`date +%a`)"
  nm="$USER"
  # replace
  sed -e "s/FN/$fn/g" -e "s/DT/$td/g" -e "s/NM/$nm/g" "$tempath.$ext" >>"$PWD/$fn"

  # open with Sublime Text
  if ls /Applications | grep "Sublime" >/dev/null 2>&1; then
    /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl "$PWD/$fn"
  fi
else
  usage
fi

exit 0
