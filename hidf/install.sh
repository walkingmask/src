#!/bin/sh
set -eu

# install.sh
# 2016/09/07(Wed)
# walkingmask
# install hidf command

if [ ! -d $HOME/bin ]; then
  mkdir $HOME/bin
fi

if [ -f ./hidf ]; then
  rm ./hidf
fi
cp ./hidf.sh ./hidf
chmod a+x hidf

if [ -f $HOME/bin/hidf ]; then
  rm $HOME/bin/hidf
fi
mv ./hidf $HOME/bin/hidf
