#!/bin/sh
set -e

# install.sh
# 2016/05/26(Thu)
# walkingmask
# install fcalc command

if [ ! -d $HOME/bin ]; then
  mkdir $HOME/bin
fi

if [ -f ./fcalc ]; then
  rm ./fcalc
fi
gcc -Ofast fcalc.c -o fcalc
chmod a+x fcalc

if [ -f $HOME/bin/fcalc ]; then
  rm $HOME/bin/fcalc
fi
mv ./fcalc $HOME/bin/fcalc
