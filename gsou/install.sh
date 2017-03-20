#!/bin/sh
set -e

# install.sh
# 2016/01/19(Tue)
# walkingmask
# install gsou command

if [ ! -d /Users/$USER/bin ]; then
  mkdir /Users/$USER/bin
fi

if [ -f ./gsou ]; then
  rm ./gsou
fi
sed -e "s|PWD|`pwd`|g" ./gsou.sh >>./gsou
chmod a+x ./gsou

if [ -f /Users/$USER/bin/gsou ]; then
  rm /Users/$USER/bin/gsou
fi
mv ./gsou /Users/$USER/bin/gsou
