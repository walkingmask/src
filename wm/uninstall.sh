#!/bin/sh
set -e

# uninstall.sh
# 2016/02/20(Sat)
# walkingmask
# uninstall wm command

if [ -f /Users/$USER/bin/wm ]; then
  rm /Users/$USER/bin/wm
fi
