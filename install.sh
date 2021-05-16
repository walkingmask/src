#!/usr/bin/env bash
set -eu

# install.sh
# updated at 2021/05/16 (Sun)
# created at 2017/03/09 (Thu)
# walkingmask

HERE=$(cd $(dirname $0); pwd)

if [ ! -d ${HOME}/bin ]; then
  mkdir ${HOME}/bin
fi

for obj in ${HERE}/*; do
  if [ -d $obj ]; then
    [[ $obj =~ ".git" ]] && continue
    echo "Install ${obj}"
    sh ${obj%/}/install.sh
    echo "Done"
  fi
done

exit 0
