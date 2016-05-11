#!/bin/sh

if ! docker images | grep arch-chrome > /dev/null; then 
  kodi-send --action="Notification(Chrome,This is the first time you are starting Chrome. It might take a few minutes to download the container...,13000)"
  docker pull escalade1/arch-chrome
fi

# Suspend audio device
kodi-send --action="RunScript(/usr/bin/audio-suspend.py)"

DOCKER_ARGS=" \
  --rm \
  --name arch-chrome \
  --privileged \
  -i \
  -e DISPLAY=:0.0 \
  -v /dev/shm:/dev/shm \
  -v /var/media:/media \
  -v /storage/.config/asound.conf:/etc/asound.conf \
  -v config:/root/.config \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /var/run/dbus:/run/dbus"

CHROME_ARGS=" \
  --user-config-dir=/root/.config/google-chrome \
  --start-maximized \
  --no-sandbox \
  --test-type"

/usr/sbin/docker run $DOCKER_ARGS escalade1/arch-chrome google-chrome-stable $CHROME_ARGS "$@" > /tmp/chrome.log 2>&1

# Resume audio device
kodi-send --action="RunScript(/usr/bin/audio-resume.py)"
