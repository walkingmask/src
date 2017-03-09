#!/bin/sh
set -e

# vm_fedora
# 2016/01/19(Tue)
# walkingmask
# generate source code templates

usage () {
  echo "Usage: gsou [-c|go|html|java|pl|py|sh] [filename]" 2>&1
  exit 1
}

# path to templates
tempath="$HOME/src/gsou/templates/template"
# registered extensions
opts="-c,-go,-html,-java,-pl,-py,-sh"

# exception handling
if [ $# -eq 2 ]; then
  [[ $opts =~ $1 ]] || usage
  # get extension
  ext=`echo $1 | tr -d '-'`
  # filename, date, name
  fn="$2.$ext"
  td="`date +%Y\\\\/%m\\\\/%d`(`date +%a`)"
  nm="$USER"
  # replace
  sed -e "s/FN/$fn/g" -e "s/DT/$td/g" -e "s/NM/$nm/g" "${tempath}.${ext}" >>"./$fn"

  # open with Sublime Text
  if ls /Applications | grep "Sublime" >/dev/null 2>&1; then
    /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl "./$fn"
  fi
else
  usage
fi

exit 0
