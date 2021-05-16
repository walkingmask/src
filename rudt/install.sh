#!/usr/bin/env bash
set -eu

# install.sh
# updated at 2021/05/16 (Sun)
# created at 2016/02/20 (Sat)
# walkingmask
# install rudt command

HERE=$(cd $(dirname $0); pwd)

if [ ! -d ${HOME}/bin ]; then
  /bin/mkdir ${HOME}/bin
fi

if [ -f ${HERE}/rudt ]; then
  /bin/rm ${HERE}/rudt
fi
/bin/cp ${HERE}/rudt.sh ${HERE}/rudt
/bin/chmod a+x ${HERE}/rudt

if [ -f ${HOME}/bin/rudt ]; then
  /bin/rm ${HOME}/bin/rudt
fi
/bin/mv ${HERE}/rudt $HOME/bin/rudt

exit 0
