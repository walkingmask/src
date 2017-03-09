#!/bin/sh
set -e

# uninstall.sh
# 2016/01/11(Mon)
# walkingmask
# uninstall ks command

if [ -f /Users/$USER/bin/ks ]; then
  rm /Users/$USER/bin/ks
fi
