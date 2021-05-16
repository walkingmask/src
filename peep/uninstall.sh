#!/usr/bin/env bash
set -eu

# uninstall.sh
# updated at 2021/05/16 (Sun)
# created at 2016/01/17 (Sun)
# walkingmask
# uninstall peep command

if [ -f ${HOME}/bin/peep ]; then
  /bin/rm ${HOME}/bin/peep
fi

if [ -d ${HOME}/.peep ]; then
  /bin/rm -rf ${HOME}/.peep
fi

if [ -z "$(ls -A ${HOME}/bin)" ]; then
  /bin/rm -rf ${HOME}/bin
fi

exit 0
