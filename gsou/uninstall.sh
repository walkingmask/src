#!/bin/sh
set -e

# uninstall.sh
# 2016/01/19(Tue)
# walkingmask
# uninstall gsou command

if [ -f /Users/$USER/bin/gsou ]; then
  rm /Users/$USER/bin/gsou
fi

if [ -d /Users/$USER/res/template/gsou ]; then
  rm -rf /Users/$USER/res/template/gsou
fi
