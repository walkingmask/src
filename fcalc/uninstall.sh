#!/usr/bin/env bash
set -eu

# uninstall.sh
# updated at 2021/05/16 (Sun)
# craeted at 2015/05/26 (Thu)
# walkingmask
# uninstall fcalc command

if [ -f ${HOME}/bin/fcalc ]; then
  /bin/rm ${HOME}/bin/fcalc
fi

if [ -z "$(ls -A ${HOME}/bin)" ]; then
  /bin/rm -rf ${HOME}/bin
fi

exit 0
