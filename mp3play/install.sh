#!/usr/bin/env bash
set -eu

if [ ! -d $HOME/bin ]; then
  mkdir $HOME/bin
fi

if [ -f ./mp3play ]; then
  rm ./mp3play
fi
cp ./mp3play.py ./mp3play
chmod a+x mp3play

if [ -f $HOME/bin/mp3play ]; then
  rm $HOME/bin/mp3play
fi
mv ./mp3play $HOME/bin/mp3play
