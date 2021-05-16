#!/usr/bin/env bash
set -eu

# mv_trash
# updated at 2021/05/16 (Sun)
# created at 2015/12/24 (Thu)
# walkingmask
# move to trash function

usage_exit() {
  echo "usage: mv_trash [-f | -i] [-dPRrvW] file ..." 1>&2
  echo "       move file to ~/.Trash" 1>&2
  exit 1
}

ORG_ARGS="$@"

FLAG_F=
FLAG_I=
FLAG_R=
FLAG_V=

while getopts fidPRrvW OPT
do
  case $OPT in
    f)  FLAG_F=1 ;;
    i)  FLAG_I=1 ;;
    d)  : ;;
    P)  : ;;
    R)  FLAG_R=1 ;;
    r)  FLAG_R=1 ;;
    v)  FLAG_V=1 ;;
    W)  : ;;
    ?)  usage_exit ;;
  esac
done

shift $((OPTIND - 1))

[ $# -eq 0 ] && usage_exit || :

if [ ! -z "$FLAG_F" ]; then
  read -p "do you really want to delete completely? " ans
  if [ "$ans" = "y" ]; then
    /bin/rm $ORG_ARGS
  else
    echo "canceled"
  fi
  exit 0
fi

timestamp=`date '+%Y.%m.%d.%H.%M.%S'`

for obj in $@; do
  if [ ! -e $obj ]; then
    echo "mv_trash: ${obj}: No such file or directory" 1>&2
    continue
  fi
  if [ -d $obj -a -z "$FLAG_R" ]; then
    echo "mv_trash: ${obj}: is a directory" 1>&2
    continue
  fi
  if [ ! -z "$FLAG_I" ]; then
    read -p "move ${obj} to ~/.Trash? " ans
    if [ "$ans" != "y" ]; then
      continue
    fi
  fi
  obj=${obj%/}
  name=${obj##*/}
  stem=${name%.*}
  # [[ "$obj" =~ / ]] && parent="${obj%/*}/" || parent=""
  [[ "$name" =~ \. ]] && suffix=".${obj##*.}" || suffix=""
  if [ -e ${HOME}/.Trash/$name ]; then
    /bin/mv $obj "${HOME}/.Trash/${stem} ${timestamp}${suffix}"
  else
    /bin/mv $obj "${HOME}/.Trash/${name}"
  fi
  if [ ! -z "$FLAG_V" ]; then
    echo $obj
  fi
done

exit 0
