#!/bin/sh
set -e

# install.sh
# 2016/02/20(Sat)
# walkingmask
# install rudt command

if [ ! -d $HOME/bin ]; then
  mkdir $HOME/bin
fi

if [ -f ./rudt ]; then
  rm ./rudt
fi
cp ./rudt.sh ./rudt
chmod a+x rudt

if [ -f $HOME/bin/rudt ]; then
  rm $HOME/bin/rudt
fi
mv ./rudt $HOME/bin/rudt
