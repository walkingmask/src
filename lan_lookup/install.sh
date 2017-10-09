#!/bin/sh
set -e

# install.sh
# 2017/08/19(Sat)
# walkingmask
# install lan_lookup command

if [ ! -d /Users/$USER/bin ]; then
  mkdir /Users/$USER/bin
fi

if [ -f ./lan_lookup ]; then
  rm ./lan_lookup
fi
cp ./lan_lookup.sh ./lan_lookup
chmod a+x lan_lookup

if [ -f /Users/$USER/bin/lan_lookup ]; then
  rm /Users/$USER/bin/lan_lookup
fi
mv ./lan_lookup /Users/$USER/bin/lan_lookup
