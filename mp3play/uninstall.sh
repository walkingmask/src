#!/usr/bin/env bash
set -eu

# uninstall.sh
# updated at 2021/05/16 (Sun)
# walkingmask
# uninstall mp3play command

if [ -f ${HOME}/bin/mp3play ]; then
  /bin/rm ${HOME}/bin/mp3play
fi

if [ -z "$(ls -A ${HOME}/bin)" ]; then
  /bin/rm -rf ${HOME}/bin
fi

exit 0
