#!/usr/bin/env bash
set -eu

# install.sh
# updated at 2021/05/16 (Sun)
# created at 2016/05/26 (Thu)
# walkingmask
# install fcalc command

HERE=$(cd $(dirname $0); pwd)

if ! command -v gcc &> /dev/null; then
  echo "WARNIG: gcc required to install fcalc"
  exit 0
fi

if [ ! -d ${HOME}/bin ]; then
  /bin/mkdir ${HOME}/bin
fi

if [ -f ${HERE}/fcalc ]; then
  /bin/rm ${HERE}/fcalc
fi

gcc -Ofast ${HERE}/fcalc.c -o ${HERE}/fcalc
/bin/chmod a+x ${HERE}/fcalc

if [ -f ${HOME}/bin/fcalc ]; then
  /bin/rm ${HOME}/bin/fcalc
fi
/bin/mv ${HERE}/fcalc ${HOME}/bin/fcalc

exit 0
