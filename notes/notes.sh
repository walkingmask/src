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
if [ ! -f ${HOME}/.config/notes/config.sh ]; then
  echo "config file ${HOME}/.config/notes/config.sh not found" >&2
  exit 1
fi
source ${HOME}/.config/notes/config.sh


# Check if the notes path exists
if [ ! -d $NOTES_LOCATION ]; then
  echo "notes dir ${NOTES_LOCATION} not found" >&2
  exit 1
fi

# Args (note name and open option)
NOTE_NAME=
OPEN_OPTION=0
if [ $# -eq 2 ] && [ "$1" = "-o" ]; then
  NOTE_NAME=$2
  OPEN_OPTION=1
fi
if [ $# -eq 2 ] && [ "$2" = "-o" ]; then
  NOTE_NAME=$1
  OPEN_OPTION=1
fi
if [ $# -eq 1 ] && [ "$1" = "-o" ]; then
  OPEN_OPTION=1
fi
if [ $# -eq 1 ] && [ "$1" != "-o" ]; then
  NOTE_NAME=$1
fi

# Get notes
if [ "$NOTE_NAME" != "" ]; then
  TARGET_NOTES=($NOTE_NAME)
else
  if [ ! "$TARGET_NOTES" = "" ]; then
    TARGET_NOTES=(`echo $TARGET_NOTES | tr -s ',' ' '`)
  else
    TARGET_NOTES=($(cd $NOTES_LOCATION; ls -1))
  fi
fi

# Validation
for note in ${TARGET_NOTES[@]}; do
  if [ ! -d ${NOTES_LOCATION}/${note} ]; then
    echo "${note} not found in ${NOTES_LOCATION}" >&2
    exit 1
  fi
done

# Open note directory on finder
if [ "${OPEN_OPTION}" = "1" ] && [ ${#TARGET_NOTES[@]} -eq 1 ]; then
  open -g ${NOTES_LOCATION}/${TARGET_NOTES[0]}
fi
if [ "${OPEN_OPTION}" = "1" ] && [ ${#TARGET_NOTES[@]} -gt 1 ]; then
  open -g $NOTES_LOCATION
fi

# Open notes
subl -n
for note in ${TARGET_NOTES[@]}; do
  if [ -f $NOTES_LOCATION/$note/__note__ ]; then
    source $NOTES_LOCATION/$note/__note__
  else
    subl -a $NOTES_LOCATION/$note
  fi
done

exit 0
