#!/bin/sh
set -e

# uninstall.sh
# 2015/05/26(Thu)
# walkingmask
# uninstall fcalc command

if [ -f $HOME/bin/fcalc ]; then
  rm $HOME/bin/fcalc
fi
