#!/usr/bin/env bash
set -eu

if [ ! -d $HOME/bin ]; then
  mkdir $HOME/bin
fi

if [ -f ./mopen ]; then
  rm ./mopen
fi
cp ./mopen.sh ./mopen
chmod a+x mopen

if [ -f $HOME/bin/mopen ]; then
  rm $HOME/bin/mopen
fi
mv ./mopen $HOME/bin/mopen
