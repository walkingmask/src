#!/usr/bin/env bash
set -eu

# uninstall.sh
# updated at 2021/05/16 (Sun)
# created at 2016/12/19 (Mon)
# walkingmask
# uninstall wdi command

if [ -f ${HOME}/bin/wdi ]; then
  /bin/rm ${HOME}/bin/wdi
fi

if [ -z "$(ls -A ${HOME}/bin)" ]; then
  /bin/rm -rf ${HOME}/bin
fi

exit 0
