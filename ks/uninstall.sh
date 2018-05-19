#!/bin/sh
set -e

# uninstall.sh
# 2016/01/11(Mon)
# walkingmask
# uninstall ks command

if [ -f $HOME/bin/ks ]; then
  rm $HOME/bin/ks
fi

if [ -d $HOME/res/sound/ks ]; then
  rm -rf $HOME/res/sound/ks
fi
