#!/bin/sh
set -e

# install.sh
# 2016/01/19(Tue)
# walkingmask
# install gsou command

if [ ! -d $HOME/bin ]; then
  mkdir $HOME/bin
fi

if [ ! -d $HOME/res/template ]; then
  mkdir -p $HOME/res/template
fi
cp -r ./template $HOME/res/template/gsou

if [ -f ./gsou ]; then
  rm ./gsou
fi
sed -e "s|PWD|`pwd`|g" ./gsou.sh >>./gsou
chmod a+x ./gsou

if [ -f $HOME/bin/gsou ]; then
  rm $HOME/bin/gsou
fi
mv ./gsou $HOME/bin/gsou
