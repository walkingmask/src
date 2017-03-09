#!/bin/sh
set -e

# install.sh
# 2016/01/17(Sun)
# walkingmask
# install peep command

if [ ! -d /Users/$USER/bin ]; then
  mkdir /Users/$USER/bin
fi

if [ -f ./peep ]; then
  rm ./peep
fi
cp ./peep.sh ./peep
chmod a+x peep

if [ -f /Users/$USER/bin/peep ]; then
  rm /Users/$USER/bin/peep
fi
mv ./peep /Users/$USER/bin/peep

if [ ! -f ./peep.mp3 ]; then
  wget http://taira-komori.jpn.org/sound/animals01/chick.mp3
fi
