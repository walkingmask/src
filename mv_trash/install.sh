#!/usr/bin/env bash
set -eu

# install.sh
# updated at 2021/05/16 (Sun)
# created at 2015/12/24 (Thu)
# walkingmask
# install mv_trash command

HERE=$(cd $(dirname $0); pwd)

if [ ! -d ${HOME}/bin ]; then
  /bin/mkdir ${HOME}/bin
fi

if [ -f ${HERE}/mv_trash ]; then
  /bin/rm ${HERE}/mv_trash
fi
/bin/cp ${HERE}/mv_trash.sh ${HERE}/mv_trash
/bin/chmod a+x ${HERE}/mv_trash

if [ -f ${HOME}/bin/mv_trash ]; then
  /bin/rm ${HOME}/bin/mv_trash
fi
/bin/mv ${HERE}/mv_trash $HOME/bin/mv_trash

exit 0
