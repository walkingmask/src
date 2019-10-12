#!/bin/bash
set -eu

#
# notes command
#


# subl command wrapper
function subl() {
  if [ ! -f /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ]; then
    echo 'subl command required' >&2
    exit 1
  fi
  /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl $@
}


# Load config
if [ ! -f $HOME/.config/notes/config.sh ]; then
  echo 'config file not found' >&2
  exit 1
fi
source $HOME/.config/notes/config.sh


# Check if the notes path exists
if [ ! -d $NOTES_LOCATION ]; then
  echo 'the notes not found' >&2
  exit 1
fi


# Args
if [ $# -eq 1 ]; then
  note=$1
  if [ ! -d $NOTES_LOCATION/$note ]; then
    echo "$note not found in $NOTES_LOCATION" >&2
    exit 1
  fi
  open -g $NOTES_LOCATION/$note
  subl -n
  if [ -f $NOTES_LOCATION/$note/__note__ ]; then
    source $NOTES_LOCATION/$note/__note__
  else
    subl -a $NOTES_LOCATION/$note
  fi
  exit 0
fi


# Get notes
if [ ! "$TARGET_NOTES" = "" ]; then
  TARGET_NOTES=(`echo $TARGET_NOTES | tr -s ',' ' '`)
else
  TARGET_NOTES=($(cd $NOTES_LOCATION; ls -1))
fi


# Run
open -g $NOTES_LOCATION
subl -n
for note in ${TARGET_NOTES[@]}; do
  if [ ! -d $NOTES_LOCATION/$note ]; then
    echo "$note not found in $NOTES_LOCATION" >&2
    continue
  fi
  if [ -f $NOTES_LOCATION/$note/__note__ ]; then
    source $NOTES_LOCATION/$note/__note__
  else
    subl -a $NOTES_LOCATION/$note
  fi
done


exit 0
