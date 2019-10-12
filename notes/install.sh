#!/bin/sh
set -eu

#
# Install notes command
#


# Set command location
COMMAND_LOCATION=$HOME/bin
echo 'Input the path to command location you want'
echo 'If input is empty, it will be installed on ~/bin'
printf '> ' && read ans
if [ "$ans" != "" ]; then
  COMMAND_LOCATION=$ans
fi
echo "Command location: $COMMAND_LOCATION"


# Check if the installation path exists
if [ ! -d $COMMAND_LOCATION ]; then
  echo "$COMMAND_LOCATION not found" 1>&2
  exit 1
fi


# Set notes directory location
NOTES_LOCATION=
echo 'Input the path of your notes directory'
printf '> ' && read ans
if [ "$ans" = "" ]; then
  echo 'Empty notes location is not allowed'
  exit 1
fi
if [ ! -e $ans ]; then
  "$ans not found"
  exit 1
fi
NOTES_LOCATION=$ans
echo "Notes location: $NOTES_LOCATION"


# Generate the config file
if [ -f $HOME/.config/notes/config.sh ]; then
  /bin/rm -f $HOME/.config/notes/config.sh
fi
/bin/mkdir -p $HOME/.config/notes
echo "COMMAND_LOCATION=$COMMAND_LOCATION" >$HOME/.config/notes/config.sh
echo "NOTES_LOCATION=$NOTES_LOCATION" >>$HOME/.config/notes/config.sh
echo "TARGET_NOTES=" >>$HOME/.config/notes/config.sh


# Remove old version
if [ -f $COMMAND_LOCATION/notes ]; then
  /bin/rm -f $COMMAND_LOCATION/notes
  echo 'Removed the old version'
fi


# Install
cp ./notes.sh $COMMAND_LOCATION/notes
chmod a+x $COMMAND_LOCATION/notes


echo 'Installation complete'
exit 0
