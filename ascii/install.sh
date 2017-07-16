#!/bin/sh
set -e

# install.sh
# 2016/12/19(Mon)
# walkingmask
# install ascii command

if [ ! -d /Users/$USER/bin ]; then
  mkdir /Users/$USER/bin
fi

if [ -f ./ascii ]; then
  rm ./ascii
fi
cp ./ascii.sh ./ascii
chmod a+x ascii

if [ -f /Users/$USER/bin/ascii ]; then
  rm /Users/$USER/bin/ascii
fi
mv ./ascii /Users/$USER/bin/ascii
