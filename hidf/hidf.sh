#!/bin/sh
set -eu

# hidf
# 2016/09/07(Wed)
# walkingmask
# hide files on/off

if [ "`defaults read com.apple.finder AppleShowAllFiles`" = "TRUE" ]; then
  defaults write com.apple.finder AppleShowAllFiles FALSE
else
  defaults write com.apple.finder AppleShowAllFiles TRUE
fi

killall Finder
