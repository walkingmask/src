#!/usr/bin/env bash
set -eu

# uninstall.sh
# updated at 2021/05/16 (Sun)
# created at 2015/01/17 (San)
# walkingmask
# uninstall rands command

if [ -f ${HOME}/bin/rands ]; then
  /bin/rm ${HOME}/bin/rands
fi

if [ -z "$(ls -A ${HOME}/bin)" ]; then
  /bin/rm -rf ${HOME}/bin
fi

exit 0
