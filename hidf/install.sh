#!/usr/bin/env bash
set -eu

# install.sh
# updated at 2021/05/16 (Sun)
# created at 2016/09/07 (Wed)
# walkingmask
# install hidf command

HERE=$(cd $(dirname $0); pwd)

if [ ! -d ${HOME}/bin ]; then
  /bin/mkdir ${HOME}/bin
fi

if [ -f ${HERE}/hidf ]; then
  /bin/rm ${HERE}/hidf
fi
/bin/cp ${HERE}/hidf.sh ${HERE}/hidf
/bin/chmod a+x ${HERE}/hidf

if [ -f ${HOME}/bin/hidf ]; then
  /bin/rm ${HOME}/bin/hidf
fi
/bin/mv ${HERE}/hidf $HOME/bin/hidf

exit 0
