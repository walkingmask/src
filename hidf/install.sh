#!/bin/sh
set -eu

# install.sh
# 2016/09/07(Wed)
# walkingmask
# install hidf command

if [ ! -d /Users/$USER/bin ]; then
  mkdir /Users/$USER/bin
fi

if [ -f ./hidf ]; then
  rm ./hidf
fi
cp ./hidf.sh ./hidf
chmod a+x hidf

if [ -f /Users/$USER/bin/hidf ]; then
  rm /Users/$USER/bin/hidf
fi
mv ./hidf /Users/$USER/bin/hidf
