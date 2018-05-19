#!/bin/sh
set -e

# install.sh
# 2016/01/17(Sun)
# walkingmask
# install rands command

if [ ! -d $HOME/bin ]; then
  mkdir $HOME/bin
fi

if [ -f ./rands ]; then
  rm ./rands
fi
gcc -Ofast rands.c -o rands
chmod a+x rands

if [ -f $HOME/bin/rands ]; then
  rm $HOME/bin/rands
fi
mv ./rands $HOME/bin/rands
