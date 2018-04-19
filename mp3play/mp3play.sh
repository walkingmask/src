#!/usr/bin/env bash
set -eu


FAVORITE=""


function usage() {
    echo "Usage: mp3play [-r] [-l] mp3" 1>&2
    exit 1
}

function play() {
    if [ $2 -eq 1 ]; then
        find "$1" -name '*.mp3' -print0 | sort -zR | xargs -n 1 -0 afplay
    else
        find "$1" -name '*.mp3' -print0 | sort -z | xargs -n 1 -0 afplay
    fi
}

RAND=0
LOOP=0

while getopts rl OPT
do
    case $OPT in
        r)  RAND=1
            ;;
        l)  LOOP=1
            ;;
        \?) usage
            ;;
    esac
done
shift $((OPTIND - 1))

if [ $# -lt 1 ]; then
    if [ "$FAVORITE" = "" ]; then
        printf "Enter your favorite mp3: " && read FAVORITE
        sed -i '' "s|FAVORITE=\"\"|FAVORITE=\"$FAVORITE\"|" "$0"
    fi
    MP3=$FAVORITE
    RAND=1
    LOOP=1
else
    MP3="$1"
fi

if [ $LOOP -eq 1 ]; then
    while true; do
        play "$MP3" $RAND
    done
else
    play "$MP3" $RAND
fi
