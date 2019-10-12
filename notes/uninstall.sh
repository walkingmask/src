#!/bin/bash
set -eu

#
# uninstall notes command
#


# Remove command
if [ -f $HOME/bin/notes ]; then
  /bin/rm -r $HOME/bin/notes
else
  if [ -f $HOME/.config/notes/config.sh ]; then
    source $HOME/.config/notes/config.sh
    /bin/rm -f $COMMAND_LOCATION/notes
  else
    echo 'Could not find command location'
    exit 1
  fi
fi


# Remove config file if it exists
if [ -e $HOME/.config/notes ]; then
  /bin/rm -rf $HOME/.config/notes
fi


echo 'Uninstallation complete'
exit 0
