#!/bin/sh
set -e

# install.sh
# 2016/02/20(Sat)
# walkingmask
# install rudt command

if [ ! -d /Users/$USER/bin ]; then
  mkdir /Users/$USER/bin
fi

if [ -f ./rudt ]; then
  rm ./rudt
fi
cp ./rudt.sh ./rudt
chmod a+x rudt

if [ -f /Users/$USER/bin/rudt ]; then
  rm /Users/$USER/bin/rudt
fi
mv ./rudt /Users/$USER/bin/rudt
