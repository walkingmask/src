#!/usr/bin/env bash
set -eu

# install.sh
# updated at 2021/05/16 (Sun)
# walkingmask
# install notes command

HERE=$(cd $(dirname $0); pwd)

if [ ! -d ${HOME}/bin ]; then
  /bin/mkdir ${HOME}/bin
fi

if [ -f ${HERE}/notes ]; then
  /bin/rm ${HERE}/notes
fi
/bin/cp ${HERE}/notes.sh ${HERE}/notes
/bin/chmod a+x ${HERE}/notes

if [ -f ${HOME}/bin/notes ]; then
  /bin/rm ${HOME}/bin/notes
fi
/bin/mv ${HERE}/notes $HOME/bin/notes

exit 0
