#!/usr/bin/env bash
set -eu

# uninstall_all.sh
# 2017/03/09(Thu)
# walkingmask

for obj in ./*; do
  if [ -d $obj ]; then
    [[ $obj =~ ".git" ]] && continue
    bash ${obj}uninstall.sh
  fi
done

exit 0
