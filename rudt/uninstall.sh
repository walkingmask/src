#!/usr/bin/env bash
set -eu

# uninstall.sh
# updated at 2021/05/16 (Sun)
# created at 2016/02/20 (Sat)
# walkingmask
# uninstall rudt command

if [ -f ${HOME}/bin/rudt ]; then
  /bin/rm ${HOME}/bin/rudt
fi

if [ -z "$(ls -A ${HOME}/bin)" ]; then
  /bin/rm -rf ${HOME}/bin
fi

exit 0
