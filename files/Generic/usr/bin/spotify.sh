#!/bin/sh

if ! docker images | grep arch-spotify > /dev/null; then 
  kodi-send --action="Notification(Spotify,This is the first time you are starting Spotify. It might take a few minutes to download the container...,13000)"
  docker pull escalade1/arch-spotify
fi

# Suspend audio device
kodi-send  --action="RunScript(/usr/bin/audio-suspend.py)"

DOCKER_ARGS=" \
  --rm \
  --name spotify \
  --privileged \
  -i \
  -e DISPLAY=:0.0 \
  -v /dev/shm:/dev/shm \
  -v /var/media:/media \
  -v /storage/.config/asound.conf:/etc/asound.conf \
  -v config:/root/.config \
  -v cache:/root/.cache \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /var/run/dbus:/run/dbus"

SPOTIFY_ARGS=""

/usr/sbin/docker run $DOCKER_ARGS escalade1/arch-spotify spotify $SPOTIFY_ARGS "$@" > /tmp/spotify.log 2>&1

# Resume audio device
kodi-send  --action="RunScript(/usr/bin/audio-resume.py)"
