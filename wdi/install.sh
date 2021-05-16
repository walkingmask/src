#!/usr/bin/env bash
set -eu

# install.sh
# updated at 2021/05/16 (Sun)
# created at 2016/12/19 (Mon)
# walkingmask
# install wdi command

HERE=$(cd $(dirname $0); pwd)

if [ ! -d ${HOME}/bin ]; then
  /bin/mkdir ${HOME}/bin
fi

if [ -f ${HERE}/wdi ]; then
  /bin/rm ${HERE}/wdi
fi
/bin/cp ${HERE}/wdi.sh ${HERE}/wdi
/bin/chmod a+x ${HERE}/wdi

if [ -f ${HOME}/bin/wdi ]; then
  /bin/rm ${HOME}/bin/wdi
fi
/bin/mv ${HERE}/wdi $HOME/bin/wdi

exit 0
