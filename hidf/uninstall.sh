#!/usr/bin/env bash
set -eu

# uninstall.sh
# updated at 2021/05/16 (Sun)
# creaetd at 2016/09/07 (Wed)
# walkingmask
# uninstall hidf command

if [ -f ${HOME}/bin/hidf ]; then
  /bin/rm ${HOME}/bin/hidf
fi

if [ -z "$(ls -A ${HOME}/bin)" ]; then
  /bin/rm -rf ${HOME}/bin
fi

exit 0
