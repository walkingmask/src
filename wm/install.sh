#!/bin/sh
set -e

# install.sh
# 2016/02/20(Sat)
# walkingmask
# install wm command

if [ ! -d $HOME/bin ]; then
  mkdir $HOME/bin
fi

if [ -f ./wm ]; then
  rm ./wm
fi
cp ./wm.sh ./wm
chmod a+x wm

if [ -f $HOME/bin/wm ]; then
  rm $HOME/bin/wm
fi
mv ./wm $HOME/bin/wm
