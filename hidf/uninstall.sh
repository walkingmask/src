#!/bin/sh
set -eu

# uninstall.sh
# 2016/09/07(Wed)
# walkingmask
# uninstall hidf command

if [ -f /Users/$USER/bin/hidf ]; then
  rm /Users/$USER/bin/hidf
fi
