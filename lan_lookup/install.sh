#!/bin/sh
set -e

# install.sh
# 2017/08/19(Sat)
# walkingmask
# install lan_lookup command

if [ ! -d $HOME/bin ]; then
  mkdir $HOME/bin
fi

if [ -f ./lan_lookup ]; then
  rm ./lan_lookup
fi
cp ./lan_lookup.sh ./lan_lookup
chmod a+x lan_lookup

if [ -f $HOME/bin/lan_lookup ]; then
  rm $HOME/bin/lan_lookup
fi
mv ./lan_lookup $HOME/bin/lan_lookup
