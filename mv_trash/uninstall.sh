#!/bin/sh
set -e

# uninstall.sh
# 2015/12/24(Thu)
# walkingmask
# uninstall mv_trash command

if [ -f /Users/$USER/bin/mv_trash ]; then
  rm /Users/$USER/bin/mv_trash
fi
