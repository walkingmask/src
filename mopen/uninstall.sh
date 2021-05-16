#!/usr/bin/env bash
set -eu

# uninstall.sh
# updated at 2021/05/16 (Sun)
# walkingmask
# uninstall mopen command

if [ -f ${HOME}/bin/mopen ]; then
  rm ${HOME}/bin/mopen
fi

if [ -z "$(ls -A ${HOME}/bin)" ]; then
  /bin/rm -rf ${HOME}/bin
fi

exit 0
