#!/bin/sh
set -e

# install.sh
# 2016/02/20(Sat)
# walkingmask
# install wm command

if [ ! -d /Users/$USER/bin ]; then
  mkdir /Users/$USER/bin
fi

if [ -f ./wm ]; then
  rm ./wm
fi
cp ./wm.sh ./wm
chmod a+x wm

if [ -f /Users/$USER/bin/wm ]; then
  rm /Users/$USER/bin/wm
fi
mv ./wm /Users/$USER/bin/wm
