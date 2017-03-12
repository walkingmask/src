#!/bin/sh
set -e

# install.sh
# 2016/01/11(Mon)
# walkingmask
# install ks command

if [ ! -d /Users/$USER/bin ]; then
  mkdir /Users/$USER/bin
fi

if [ -f ./ks ]; then
  rm ./ks
fi
cp ./ks.sh ./ks
chmod a+x ks

if [ -f /Users/$USER/bin/ks ]; then
  rm /Users/$USER/bin/ks
fi
mv ./ks /Users/$USER/bin/ks

if [ ! -f "$HOME/Music/bell.mp3" ]; then
  wget http://sound.gob.jp/library/mp3/S_651.mp3 -O $HOME/Music/bell.mp3
fi
