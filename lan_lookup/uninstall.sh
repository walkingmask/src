#!/usr/bin/env bash
set -eu

# uninstall.sh
# updated at 2021/05/16 (Sun)
# created at 2017/08/19 (Sat)
# walkingmask
# uninstall lan_lookup command

if [ -f ${HOME}/bin/lan_lookup ]; then
  /bin/rm ${HOME}/bin/lan_lookup
fi

if [ -z "$(ls -A ${HOME}/bin)" ]; then
  /bin/rm -rf ${HOME}/bin
fi

exit 0
