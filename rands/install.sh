#!/bin/sh
set -e

# install.sh
# 2016/01/17(Sun)
# walkingmask
# install rands command

if [ ! -d /Users/$USER/bin ]; then
  mkdir /Users/$USER/bin
fi

if [ -f ./rands ]; then
  rm ./rands
fi
gcc -Ofast rands.c -o rands
chmod a+x rands

if [ -f /Users/$USER/bin/rands ]; then
  rm /Users/$USER/bin/rands
fi
mv ./rands /Users/$USER/bin/rands
