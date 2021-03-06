#!/bin/sh

. /etc/profile

MAX_DRIVES=20
i=0

emu_start

# Set some common variables
TMP_DIR=/tmp/fs-uae
CONFIG="$TMP_DIR"/.conf.fs-uae

# Check if we are loading a zip file
if [ `echo $1 | grep -i .zip | wc -l` -eq 1 ]; then
# Copy over the default configuration
  mkdir -p "$TMP_DIR"
  cp ~/.config/fs-uae/Configurations/Default.fs-uae "$TMP_DIR"/.conf.fs-uae
  unzip -q -o "$1" -d "$TMP_DIR"
  # Check for AGA game and set model to A1200
  if [ `echo $1 | egrep 'AGA|CD32' | wc -l` -eq 1 -o `echo "$TMP_DIR"/* | egrep 'AGA|CD32' | wc -l` -eq 1 ]; then
    ARGS="amiga_model = a1200\nkickstart_file = kick31.rom"
  fi
  for FILE in "$TMP_DIR"/*
  do
    ARGS="$ARGS\nfloppy_drive_$i = "$FILE"\nfloppy_image_$i = "$FILE""
    i=$(($i+1))
    # Stop adding drives at MAX_DRIVES
    if [ $i -eq $MAX_DRIVES ]; then
      break;
    fi
  done
  echo -e $ARGS >> $CONFIG
  $PASUSPENDER fs-uae $CONFIG > /var/log/fs-uae.log 2>&1
#Check if we are loading a configuration file
elif [ `echo $1 | grep -i .fs-uae | wc -l` -eq 1 ]; then
  $PASUSPENDER fs-uae "$1" > /var/log/fs-uae.log 2>&1
else
  # Check for AGA game
  if [ `echo $1 | egrep 'AGA|CD32' | wc -l` -eq 1 -o `echo "$TMP_DIR"/* | egrep 'AGA|CD32' | wc -l` -eq 1 ]; then
    ARGS="--amiga-model=a1200 --kickstart_file=kick31.rom"
  fi
  $PASUSPENDER fs-uae --floppy-drive-0="$1" $ARGS > /var/log/fs-uae.log 2>&1
fi

# Remove temporary dir
rm -rf "$TMP_DIR"

emu_stop
