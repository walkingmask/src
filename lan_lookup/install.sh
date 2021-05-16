#!/usr/bin/env bash
set -eu

# install.sh
# updated at 2021/05/16 (Sun)
# created at 2017/08/19 (Sat)
# walkingmask
# install lan_lookup command

HERE=$(cd $(dirname $0); pwd)

if [ ! -d ${HOME}/bin ]; then
  /bin/mkdir ${HOME}/bin
fi

if [ -f ${HERE}/lan_lookup ]; then
  /bin/rm ${HERE}/lan_lookup
fi
/bin/cp ${HERE}/lan_lookup.sh ${HERE}/lan_lookup
/bin/chmod a+x ${HERE}/lan_lookup

if [ -f ${HOME}/bin/lan_lookup ]; then
  /bin/rm ${HOME}/bin/lan_lookup
fi
/bin/mv ${HERE}/lan_lookup $HOME/bin/lan_lookup

exit 0
