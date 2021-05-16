#!/usr/bin/env bash
set -eu

# install.sh
# updated at 2021/05/16 (Sun)
# created at 2016/01/17 (Sun)
# walkingmask
# install rands command

HERE=$(cd $(dirname $0); pwd)

if ! command -v gcc &> /dev/null; then
  echo "WARNIG: gcc required to install rands"
  exit 0
fi

if [ ! -d ${HOME}/bin ]; then
  /bin/mkdir ${HOME}/bin
fi

if [ -f ${HERE}/rands ]; then
  /bin/rm ${HERE}/rands
fi

gcc -Ofast ${HERE}/rands.c -o ${HERE}/rands
/bin/chmod a+x ${HERE}/rands

if [ -f ${HOME}/bin/rands ]; then
  /bin/rm ${HOME}/bin/rands
fi
/bin/mv ${HERE}/rands ${HOME}/bin/rands

exit 0
