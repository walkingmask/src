#!/usr/bin/env bash
set -eu

# install_all.sh
# 2017/03/09(Thu)
# walkingmask

for f in *; do
  if [[ "$f" =~ ".sh" ]] || [[ "$f" =~ ".md" ]]; then
    continue
  fi
  cd $f
  bash install.sh
  cd ..
done

exit 0
