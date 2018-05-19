#!/bin/sh
set -e

# uninstall.sh
# 2016/02/20(Sat)
# walkingmask
# uninstall wm command

if [ -f $HOME/bin/wm ]; then
  rm $HOME/bin/wm
fi
