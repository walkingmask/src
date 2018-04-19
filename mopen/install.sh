#!/usr/bin/env bash
set -eu

if [ ! -d /Users/$USER/bin ]; then
  mkdir /Users/$USER/bin
fi

if [ -f ./mopen ]; then
  rm ./mopen
fi
cp ./mopen.sh ./mopen
chmod a+x mopen

if [ -f /Users/$USER/bin/mopen ]; then
  rm /Users/$USER/bin/mopen
fi
mv ./mopen /Users/$USER/bin/mopen
