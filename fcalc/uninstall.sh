#!/bin/sh
set -e

# uninstall.sh
# 2015/05/26(Thu)
# walkingmask
# uninstall fcalc command

if [ -f /Users/$USER/bin/fcalc ]; then
  rm /Users/$USER/bin/fcalc
fi
