#!/usr/bin/env bash
set -eu

# uninstall_all.sh
# updated at 2021/05/16 (Sun)
# created at 2017/03/09 (Thu)
# walkingmask

HERE=$(cd $(dirname $0); pwd)

for obj in ${HERE}/*; do
  if [ -d $obj ]; then
    [[ $obj =~ ".git" ]] && continue
    sh ${obj%/}/uninstall.sh
  fi
done

if [ -z "$(ls -A ${HOME}/bin)" ]; then
  /bin/rm -rf ${HOME}/bin
else
  echo "${HOME}/bin is not empty"
  echo "If you don't need it, delete it yourself"
fi

exit 0
