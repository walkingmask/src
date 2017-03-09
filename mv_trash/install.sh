#!/bin/sh
set -e

# install.sh
# 2015/12/24(Thu)
# walkingmask
# install mv_trash command

if [ ! -d /Users/$USER/bin ]; then
  mkdir /Users/$USER/bin
fi

if [ -f ./mv_trash ]; then
  rm ./mv_trash
fi
cp ./mv_trash.sh ./mv_trash
chmod a+x mv_trash

if [ -f /Users/$USER/bin/mv_trash ]; then
  rm /Users/$USER/bin/mv_trash
fi
mv ./mv_trash /Users/$USER/bin/mv_trash
