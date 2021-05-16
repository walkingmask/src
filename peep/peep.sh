#!/usr/bin/env bash

# peep
# updated at 2021/05/16 (Sun)
# created at 2016/01/17 (Sun)
# walkingmask
# Play the peep sound effect

sound_file_path="${HOME}/.peep/peep.mp3"

if [ -f $sound_file_path ]; then
  if command -v afplay &>/dev/null; then
    afplay -v 0.1 $sound_file_path
  fi
fi
