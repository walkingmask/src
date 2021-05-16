#!/usr/bin/env bash
set -eu

# notes
# updated at 2021/05/16 (Sun)
# walkingmask
# The util tool to help me write notes

# Editor (Sublime Text or VSCode)
function _subl () {
  /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl "$@"
}
function _code () {
  /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code "$@"
}
NOTE_EDITOR=
if [ -e /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ]; then
  NOTE_EDITOR=_subl
elif [ -f /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code ]; then
  NOTE_EDITOR=_code
fi
if [ -z "$NOTE_EDITOR" ]; then
  echo "The command subl nor code not found. Please install either one" 1>&2
  exit 1
fi

# Initialization
if [ ! -f ${HOME}/.config/notes/config.sh ]; then

  echo "input the path of your notes directory"
  printf "> " && read NOTES_LOCATION

  if [ "$NOTES_LOCATION" = "" ]; then
    echo "empty location is not allowed" 1>&2
    exit 1
  fi
  if [ ! -e $NOTES_LOCATION ]; then
    "${NOTES_LOCATION} not found" 1>&2
    exit 1
  fi

  echo "input target notes (comma separated, no space) (e.g. note,todo)"
  printf "> " && read TARGET_NOTES

  _TARGET_NOTES=(`echo $TARGET_NOTES | tr -s ',' ' '`)
  for note in ${_TARGET_NOTES[@]}; do
    if [ ! -d ${NOTES_LOCATION}/${note} ]; then
      echo "${NOTES_LOCATION}/${note} not found" 1>&2
      exit 1
    fi
  done

  /bin/mkdir -p ${HOME}/.config/notes
  echo "NOTES_LOCATION=${NOTES_LOCATION}" >${HOME}/.config/notes/config.sh
  echo "TARGET_NOTES=${TARGET_NOTES}" >>${HOME}/.config/notes/config.sh

  echo "Save config to ${HOME}/.config/notes/config.sh"

fi

# Load config
source ${HOME}/.config/notes/config.sh

# Check if the notes path exists
if [ ! -d $NOTES_LOCATION ]; then
  echo "notes dir ${NOTES_LOCATION} not found" 1>&2
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
    echo "${note} not found in ${NOTES_LOCATION}" 1>&2
    exit 1
  fi
done

# Open note directory on finder
if [ "$OPEN_OPTION" = "1" ] && [ ${#TARGET_NOTES[@]} -eq 1 ]; then
  open -g ${NOTES_LOCATION}/${TARGET_NOTES[0]}
fi
if [ "$OPEN_OPTION" = "1" ] && [ ${#TARGET_NOTES[@]} -gt 1 ]; then
  open -g $NOTES_LOCATION
fi

# Open notes
$NOTE_EDITOR -n
for note in ${TARGET_NOTES[@]}; do
  if [ -f ${NOTES_LOCATION}/${note}/__note__ ]; then
    source ${NOTES_LOCATION}/${note}/__note__
  else
    $NOTE_EDITOR -a ${NOTES_LOCATION}/${note}
  fi
done

exit 0
