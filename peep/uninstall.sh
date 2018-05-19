#!/bin/sh
set -e

# uninstall.sh
# 2016/01/17(Sun)
# walkingmask
# uninstall peep command

if [ -f $HOME/bin/peep ]; then
  rm $HOME/bin/peep
fi

if [ -d $HOME/res/sound/peep ]; then
  rm -rf $HOME/res/sound/peep
fi
