#!/usr/bin/env bash
set -eu

# uninstall.sh
# updated at 2021/05/16 (Sun)
# created at 2015/12/24 (Thu)
# walkingmask
# uninstall mv_trash command

if [ -f ${HOME}/bin/mv_trash ]; then
  /bin/rm ${HOME}/bin/mv_trash
fi

if [ -z "$(ls -A ${HOME}/bin)" ]; then
  /bin/rm -rf ${HOME}/bin
fi

exit 0
