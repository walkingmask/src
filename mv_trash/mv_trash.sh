#!/usr/bin/env bash
set -eu

# mv_trash
# 2015/12/24(Thu)
# walkingmask
# move to trash function

if [ $# -eq 0 ]; then
  echo "error. please specify some files."
  exit 1
fi

if [ "$1" = "-f" ] || [ "$1" = "-rf" ]; then
  read -p "do you really want to delete? [y/(n)]: " ans
  if [ "$ans" = "y" ]; then
    shift
    /bin/rm -rf $@
    echo "the files were completely deleted."
  else
    echo "complete removal is canceled."
  fi
  exit 0
fi

if [ "$1" = "-r" ]; then
  shift
fi

num=_`date '+%Y%m%d%H%M%S'`
for obj in $@; do
  oname_ext="${obj##*/}"
  oname="${oname_ext%.*}"
  [[ "$obj" =~ / ]] && opath="${obj%/*}/" || opath=""
  [[ "$oname_ext" =~ \. ]] && oext=".${oname_ext##*.}" || oext=""
  if [ -e ~/.Trash/$oname$oext ]; then
    mv $opath$oname_ext ~/.Trash/$oname$num$oext
  else
    mv $opath$oname_ext ~/.Trash/$oname$oext
  fi
done
