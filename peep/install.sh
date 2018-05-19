#!/bin/sh
set -e

# install.sh
# 2016/01/17(Sun)
# walkingmask
# install peep command

if [ ! -d $HOME/bin ]; then
  mkdir $HOME/bin
fi

if [ ! -d $HOME/res/sound/peep ]; then
  mkdir -p $HOME/res/sound/peep
fi

if [ ! -f $HOME/res/sound/peep/peep.mp3 ]; then
  wget http://taira-komori.jpn.org/sound/animals01/chick.mp3 -O $HOME/res/sound/peep/peep.mp3
fi

if [ -f ./peep ]; then
  rm ./peep
fi
cp ./peep.sh ./peep
chmod a+x peep

if [ -f $HOME/bin/peep ]; then
  rm $HOME/bin/peep
fi
mv ./peep $HOME/bin/peep
