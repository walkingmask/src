#!/usr/bin/env bash
set -eu

# install.sh
# updated at 2021/05/16 (Sun)
# creaetd at 2016/01/19 (Tue)
# walkingmask
# install gsou command

HERE=$(cd $(dirname $0); pwd)

if [ ! -d ${HOME}/bin ]; then
  /bin/mkdir ${HOME}/bin
fi

if [ -d ${HOME}/.gsou ]; then
  /bin/rm -rf ${HOME}/.gsou
fi
/bin/cp -r ${HERE}/template ${HOME}/.gsou

if [ -f ${HERE}/gsou ]; then
  rm ${HERE}/gsou
fi
/bin/cp ${HERE}/gsou.sh ${HERE}/gsou
/bin/chmod a+x ${HERE}/gsou

if [ -f ${HOME}/bin/gsou ]; then
  /bin/rm ${HOME}/bin/gsou
fi
mv ${HERE}/gsou ${HOME}/bin/gsou

exit 0
