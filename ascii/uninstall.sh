#!/usr/bin/env bash
set -eu

# uninstall.sh
# updated at 2021/05/16 (Sun)
# created at 2016/12/19 (Mon)
# walkingmask
# uninstall ascii command

if [ -f ${HOME}/bin/ascii ]; then
  /bin/rm ${HOME}/bin/ascii
fi

if [ -z "$(ls -A ${HOME}/bin)" ]; then
  /bin/rm -rf ${HOME}/bin
fi

exit 0
