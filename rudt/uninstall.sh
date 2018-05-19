#!/bin/sh
set -e

# uninstall.sh
# 2016/02/20(Sat)
# walkingmask
# uninstall rudt command

if [ -f $HOME/bin/rudt ]; then
  rm $HOME/bin/rudt
fi
