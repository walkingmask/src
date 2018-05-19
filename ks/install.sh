#!/bin/sh
set -e

# install.sh
# 2016/01/11(Mon)
# walkingmask
# install ks command

if [ ! -d $HOME/bin ]; then
  mkdir $HOME/bin
fi

if [ ! -d $HOME/res/sound/ks ]; then
  mkdir -p $HOME/res/sound/ks
fi

if [ ! -f $HOME/res/sound/ks/bell.mp3 ]; then
  wget http://sound.gob.jp/library/mp3/S_651.mp3 -O $HOME/res/sound/ks/bell.mp3
fi

if [ -f ./ks ]; then
  rm ./ks
fi
cp ./ks.sh ./ks
chmod a+x ks

if [ -f $HOME/bin/ks ]; then
  rm $HOME/bin/ks
fi
mv ./ks $HOME/bin/ks
