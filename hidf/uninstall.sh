#!/bin/sh
set -eu

# uninstall.sh
# 2016/09/07(Wed)
# walkingmask
# uninstall hidf command

if [ -f $HOME/bin/hidf ]; then
  rm $HOME/bin/hidf
fi
