#!/usr/bin/env bash
set -eu

# uninstall.sh
# updated at 2021/05/16 (Sun)
# created at 2016/01/19 (Tue)
# walkingmask
# uninstall gsou command

if [ -f ${HOME}/bin/gsou ]; then
  /bin/rm ${HOME}/bin/gsou
fi

if [ -d ${HOME}/.gsou/template ]; then
  /bin/rm -rf ${HOME}/.gsou/template
fi

if [ -z "$(ls -A ${HOME}/bin)" ]; then
  /bin/rm -rf ${HOME}/bin
fi

exit 0
