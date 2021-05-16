#!/usr/bin/env bash
set -eu

# install.sh
# updated at 2021/05/16 (Sun)
# created at 2016/12/19 (Mon)
# walkingmask
# install ascii command

HERE=$(cd $(dirname $0); pwd)

if [ ! -d ${HOME}/bin ]; then
  /bin/mkdir ${HOME}/bin
fi

if [ -f ${HERE}/ascii ]; then
  /bin/rm ${HERE}/ascii
fi
/bin/cp ${HERE}/ascii.sh ${HERE}/ascii
/bin/chmod a+x ${HERE}/ascii

if [ -f ${HOME}/bin/ascii ]; then
  /bin/rm ${HOME}/bin/ascii
fi
/bin/mv ${HERE}/ascii $HOME/bin/ascii

exit 0
