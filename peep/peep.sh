#!/bin/sh

# peep
# 2016/01/17(Sun)
# walkingmask
# Play the peep sound effect

filepath="$HOME/res/sound/peep/peep.mp3"

if [ ! -f "$filepath" ]; then
  echo "error. sound file is not exist."
  exit 1
fi

afplay -v 0.1 "$filepath"
