#!/usr/bin/env bash
set -eu

# install.sh
# updated at 2021/05/16 (Sun)
# created at 2016/01/17 (Sun)
# walkingmask
# install peep command

HERE=$(cd $(dirname $0); pwd)

if ! command -v wget &>/dev/null && ! command -v curl &>/dev/null; then
  echo "WARNING: wget or curl requried to install peep command" 1>&2
  exit 0
fi

if [ ! -d ${HOME}/bin ]; then
  /bin/mkdir ${HOME}/bin
fi

if [ -d $HOME/.peep ]; then
  /bin/rm -rf $HOME/.peep
fi
mkdir -p $HOME/.peep

if [ ! -f ${HOME}/.peep/peep.mp3 ]; then
  if command -v wget &>/dev/null; then
    wget http://taira-komori.jpn.org/sound/animals01/chick.mp3 -O $HOME/.peep/peep.mp3
  elif command -v curl &>/dev/null; then
    curl -L http://taira-komori.jpn.org/sound/animals01/chick.mp3 --output $HOME/.peep/peep.mp3
  fi
fi

if [ -f ${HERE}/peep ]; then
  /bin/rm ${HERE}/peep
fi
/bin/cp ${HERE}/peep.sh ${HERE}/peep
/bin/chmod a+x ${HERE}/peep

if [ -f ${HOME}/bin/peep ]; then
  /bin/rm ${HOME}/bin/peep
fi
/bin/mv ${HERE}/peep $HOME/bin/peep

exit 0
