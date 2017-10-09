#!/bin/sh
set -e

# uninstall.sh
# 2016/01/17(Sun)
# walkingmask
# uninstall peep command

if [ -f /Users/$USER/bin/peep ]; then
  rm /Users/$USER/bin/peep
fi

if [ -d /Users/$USER/res/sound/peep ]; then
  rm -rf /Users/$USER/res/sound/peep
fi
