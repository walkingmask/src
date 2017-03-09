#!/bin/sh
set -e

# uninstall.sh
# 2016/12/19(Mon)
# walkingmask
# uninstall wdi command

if [ -f /Users/$USER/bin/wdi ]; then
  rm /Users/$USER/bin/wdi
fi
