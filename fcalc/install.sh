#!/bin/sh
set -e

# install.sh
# 2016/05/26(Thu)
# walkingmask
# install fcalc command

if [ ! -d /Users/$USER/bin ]; then
  mkdir /Users/$USER/bin
fi

if [ -f ./fcalc ]; then
  rm ./fcalc
fi
gcc -Ofast fcalc.c -o fcalc
chmod a+x fcalc

if [ -f /Users/$USER/bin/fcalc ]; then
  m /Users/$USER/bin/fcalc
fi
mv ./fcalc /Users/$USER/bin/fcalc
