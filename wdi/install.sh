#!/bin/sh
set -e

# install.sh
# 2016/12/19(Mon)
# walkingmask
# install wdi command

if [ ! -d /Users/$USER/bin ]; then
  mkdir /Users/$USER/bin
fi

if [ -f ./wdi ]; then
  rm ./wdi
fi
cp ./wdi.sh ./wdi
chmod a+x wdi

if [ -f /Users/$USER/bin/wdi ]; then
  rm /Users/$USER/bin/wdi
fi
mv ./wdi /Users/$USER/bin/wdi
