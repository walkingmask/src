#!/usr/bin/env bash
set -eu

# install.sh
# updated at 2021/05/16 (Sun)
# created at 2016/02/20 (Sat)
# walkingmask
# install wm command

HERE=$(cd $(dirname $0); pwd)

if [ ! -d ${HOME}/bin ]; then
  /bin/mkdir ${HOME}/bin
fi

if [ -f ${HERE}/wm ]; then
  /bin/rm ${HERE}/wm
fi
/bin/cp ${HERE}/wm.sh ${HERE}/wm
/bin/chmod a+x ${HERE}/wm

if [ -f ${HOME}/bin/wm ]; then
  /bin/rm ${HOME}/bin/wm
fi
/bin/mv ${HERE}/wm $HOME/bin/wm

exit 0
