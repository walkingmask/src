#!/bin/sh
set -e

# uninstall.sh
# 2015/12/24(Thu)
# walkingmask
# uninstall mv_trash command

if [ -f $HOME/bin/mv_trash ]; then
  rm $HOME/bin/mv_trash
fi
