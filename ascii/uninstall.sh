#!/bin/sh
set -e

# uninstall.sh
# 2016/12/19(Mon)
# walkingmask
# uninstall ascii command

if [ -f $HOME/bin/ascii ]; then
  rm $HOME/bin/ascii
fi
