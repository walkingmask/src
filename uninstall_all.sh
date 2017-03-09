#!/usr/bin/env bash
set -eu

# uninstall_all.sh
# 2017/03/09(Thu)
# walkingmask

for f in *; do
  if [[ "$f" =~ "sh" ]]; then
    continue
  fi
  cd $f
  bash uninstall.sh
  cd ..
done

exit 0

exit 0
