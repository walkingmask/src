#!/bin/sh
set -e

# uninstall.sh
# 2016/01/19(Tue)
# walkingmask
# uninstall gsou command

if [ -f $HOME/bin/gsou ]; then
  rm $HOME/bin/gsou
fi

if [ -d $HOME/res/template/gsou ]; then
  rm -rf $HOME/res/template/gsou
fi
