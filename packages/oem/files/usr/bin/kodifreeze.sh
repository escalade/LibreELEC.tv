#!/bin/sh

# Script to suspend/resume audio and freeze/unfreeze the Kodi process

kodi_freeze() {
  kodi-send --action="RunScript(/usr/bin/audio-suspend.py)"
  if [ ! "$1" = "muteonly" ]; then
    usleep 500000
    killall -SIGSTOP kodi.bin
  fi
  touch /tmp/.kodifreeze
}

kodi_unfreeze() {
  [ ! "$1" = "muteonly" ] && killall -SIGCONT kodi.bin
  kodi-send --action="RunScript(/usr/bin/audio-resume.py)"
  rm /tmp/.kodifreeze
}

case $1 in
  freeze)
    if [ ! -f /tmp/.kodifreeze ]; then
      pidof kodi.bin > /dev/null && KODI=1
      if [ "$KODI" = "1" ]; then
        kodi_freeze $2
      else
        echo "Kodi isn't running, nothing to do."
      fi
    else
      echo "Kodi already frozen, nothing to do."
    fi
    ;;
  unfreeze)
    if [ -f /tmp/.kodifreeze ]; then
      kodi_unfreeze $2
    else
      echo "Kodi isn't frozen, nothing to do."
    fi
    ;;
  *)
    echo "Usage: $0 [freeze|unfreeze] [muteonly]"
    ;;
esac
