#!/bin/sh
set -e

# uninstall.sh
# 2016/02/20(Sat)
# walkingmask
# uninstall rudt command

if [ -f /Users/$USER/bin/rudt ]; then
  rm /Users/$USER/bin/rudt
fi
