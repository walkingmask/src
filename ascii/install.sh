#!/bin/sh
set -e

# install.sh
# 2016/12/19(Mon)
# walkingmask
# install ascii command

if [ ! -d $HOME/bin ]; then
  mkdir $HOME/bin
fi

if [ -f ./ascii ]; then
  rm ./ascii
fi
cp ./ascii.sh ./ascii
chmod a+x ascii

if [ -f $HOME/bin/ascii ]; then
  rm $HOME/bin/ascii
fi
mv ./ascii $HOME/bin/ascii
