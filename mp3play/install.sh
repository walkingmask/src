#!/usr/bin/env bash
set -eu

if [ ! -d /Users/$USER/bin ]; then
  mkdir /Users/$USER/bin
fi

if [ -f ./mp3play ]; then
  rm ./mp3play
fi
cp ./mp3play.sh ./mp3play
chmod a+x mp3play

if [ -f /Users/$USER/bin/mp3play ]; then
  rm /Users/$USER/bin/mp3play
fi
mv ./mp3play /Users/$USER/bin/mp3play
