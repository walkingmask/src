#!/usr/bin/env bash
set -eu

# uninstall.sh
# updated at 2021/05/16 (Sun)
# created at 2016/01/11 (Mon)
# walkingmask
# uninstall ks command

if [ -f ${HOME}/bin/ks ]; then
  /bin/rm ${HOME}/bin/ks
fi

if [ -d ${HOME}/.ks ]; then
  rm -rf ${HOME}/.ks
fi

if [ -z "$(ls -A ${HOME}/bin)" ]; then
  /bin/rm -rf ${HOME}/bin
fi

exit 0
