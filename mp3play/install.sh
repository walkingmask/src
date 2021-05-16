#!/usr/bin/env bash
set -eu

# install.sh
# updated at 2021/05/16 (Sun)
# walkingmask
# install mp3play command

HERE=$(cd $(dirname $0); pwd)

if [ ! -d ${HOME}/bin ]; then
  /bin/mkdir ${HOME}/bin
fi

if [ -f ${HERE}/mp3play ]; then
  /bin/rm ${HERE}/mp3play
fi
/bin/cp ${HERE}/mp3play.py ${HERE}/mp3play
/bin/chmod a+x ${HERE}/mp3play

if [ -f ${HOME}/bin/mp3play ]; then
  /bin/rm ${HOME}/bin/mp3play
fi
/bin/mv ${HERE}/mp3play $HOME/bin/mp3play

exit 0
