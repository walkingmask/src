#!/bin/sh
set -e

# uninstall.sh
# 2015/01/17(San)
# walkingmask
# uninstall rands command

if [ -f $HOME/bin/rands ]; then
  rm $HOME/bin/rands
fi

if [ -L /usr/local/bin/rands ]; then
  sudo rm /usr/local/bin/rands
fi