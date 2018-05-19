#!/bin/sh
set -e

# uninstall.sh
# 2017/08/19(Sat)
# walkingmask
# uninstall lan_lookup command

if [ -f $HOME/bin/lan_lookup ]; then
  rm $HOME/bin/lan_lookup
fi
