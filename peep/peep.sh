#!/bin/sh

# peep
# 2016/01/17(Sun)
# walkingmask
# Play the peep sound effect

file="peep.mp3"

if [ ! -f "$HOME/Music/$file" ]; then
  echo "error. sound file is not exist."
  exit 1
fi

afplay "$HOME/Music/$file"
