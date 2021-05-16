#!/usr/bin/env bash
set -eu

# install.sh
# updated at 2021/05/16 (Sun)
# created at 2016/01/11 (Mon)
# walkingmask
# install ks command

HERE=$(cd $(dirname $0); pwd)

if ! command -v wget &>/dev/null && ! command -v curl &>/dev/null; then
  echo "WARNING: wget or curl requried to install ks command" 1>&2
  exit 0
fi

if [ ! -d ${HOME}/bin ]; then
  /bin/mkdir ${HOME}/bin
fi

if [ -d ${HOME}/.ks ]; then
  /bin/rm -rf ${HOME}/.ks
fi
/bin/mkdir -p ${HOME}/.ks

if [ ! -f ${HOME}/.ks/bell.mp3 ]; then
  if command -v wget &>/dev/null; then
    wget http://sound.gob.jp/library/mp3/S_651.mp3 -O $HOME/.ks/bell.mp3
  elif command -v curl &>/dev/null; then
    curl -L http://sound.gob.jp/library/mp3/S_651.mp3 --output $HOME/.ks/bell.mp3
  fi
fi

if [ -f ${HERE}/ks ]; then
  /bin/rm ${HERE}/ks
fi
/bin/cp ${HERE}/ks.sh ${HERE}/ks
/bin/chmod a+x ${HERE}/ks

if [ -f ${HOME}/bin/ks ]; then
  /bin/rm ${HOME}/bin/ks
fi
/bin/mv ${HERE}/ks $HOME/bin/ks

exit 0
