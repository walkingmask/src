#!/usr/bin/env bash
set -eu

# uninstall.sh
# updated at 2021/05/16 (Sun)
# created at 2016/02/20 (Sat)
# walkingmask
# uninstall wm command

if [ -f ${HOME}/bin/wm ]; then
  /bin/rm ${HOME}/bin/wm
fi

if [ -z "$(ls -A ${HOME}/bin)" ]; then
  /bin/rm -rf ${HOME}/bin
fi

exit 0
