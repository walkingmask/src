#!/usr/bin/env bash
set -eu

# uninstall.sh
# updated at 2021/05/16 (Sun)
# walkingmask
# uninstall notes command

if [ -f $HOME/bin/notes ]; then
  /bin/rm -r $HOME/bin/notes
fi

if [ -z "$(ls -A ${HOME}/bin)" ]; then
  /bin/rm -rf ${HOME}/bin
fi

if [ -e ${HOME}/.config/notes ]; then
  /bin/rm -rf ${HOME}/.config/notes
fi

exit 0
