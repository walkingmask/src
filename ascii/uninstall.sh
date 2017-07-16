#!/bin/sh
set -e

# uninstall.sh
# 2016/12/19(Mon)
# walkingmask
# uninstall ascii command

if [ -f /Users/$USER/bin/ascii ]; then
  rm /Users/$USER/bin/ascii
fi
