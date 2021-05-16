#!/usr/bin/env bash
set -eu

# install.sh
# updated at 2021/05/16 (Sun)
# walkingmask
# install mopen command

HERE=$(cd $(dirname $0); pwd)

if [ ! -d ${HOME}/bin ]; then
  /bin/mkdir ${HOME}/bin
fi

if [ -f ${HERE}/mopen ]; then
  /bin/rm ${HERE}/mopen
fi
/bin/cp ${HERE}/mopen.sh ${HERE}/mopen
/bin/chmod a+x ${HERE}/mopen

if [ -f ${HOME}/bin/mopen ]; then
  /bin/rm ${HOME}/bin/mopen
fi
/bin/mv ${HERE}/mopen $HOME/bin/mopen

exit 0
