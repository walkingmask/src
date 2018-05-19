#!/bin/sh
set -e

# install.sh
# 2016/12/19(Mon)
# walkingmask
# install wdi command

if [ ! -d $HOME/bin ]; then
  mkdir $HOME/bin
fi

if [ -f ./wdi ]; then
  rm ./wdi
fi
cp ./wdi.sh ./wdi
chmod a+x wdi

if [ -f $HOME/bin/wdi ]; then
  rm $HOME/bin/wdi
fi
mv ./wdi $HOME/bin/wdi
