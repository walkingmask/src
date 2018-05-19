#!/bin/sh
set -e

# uninstall.sh
# 2016/12/19(Mon)
# walkingmask
# uninstall wdi command

if [ -f $HOME/bin/wdi ]; then
  rm $HOME/bin/wdi
fi
