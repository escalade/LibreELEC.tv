#!/bin/sh

. /etc/profile

export `wget -q -O - "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=plex-media-server" | grep -E '^pkgver='` || exit 1
export `wget -q -O - "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=plex-media-server" | grep -E '^_pkgsum='` || exit 1
PLEXVER=$pkgver-$_pkgsum

export PLEX_MEDIA_SERVER_HOME=/storage/.cache/app.plex
export PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR=/storage/.config
export PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS=6
export PLEX_MEDIA_SERVER_MAX_STACK_SIZE=10000
export PLEX_MEDIA_SERVER_MAX_LOCK_MEM=3000
export PLEX_MEDIA_SERVER_MAX_OPEN_FILES=4096
export PLEX_MEDIA_SERVER_TMPDIR=$PLEX_MEDIA_SERVER_HOME/tmp
export LD_LIBRARY_PATH=$PLEX_MEDIA_SERVER_HOME

ulimit -l $PLEX_MEDIA_SERVER_MAX_LOCK_MEM
ulimit -s $PLEX_MEDIA_SERVER_MAX_STACK_SIZE
ulimit -n $PLEX_MEDIA_SERVER_MAX_OPEN_FILES

install_plex() {
  mkdir -p /tmp/runplex ; cd /tmp/runplex
  case `uname -m` in
    x86_64)
      wget -q https://downloads.plex.tv/plex-media-server/$1/plexmediaserver-$1.x86_64.rpm || exit 1
      rpm2cpio plexmediaserver-$1.x86_64.rpm | cpio -di 2>/dev/null
      ;;
    armv7l)
      wget -q https://downloads.plex.tv/plex-media-server/$1/PlexMediaServer-$1-arm7.spk || exit 1
      tar -xf PlexMediaServer-$1-arm7.spk
      mkdir -p usr/lib/plexmediaserver
      tar -zxf package.tgz -C usr/lib/plexmediaserver
      ;;
  esac
  rm -rf $PLEX_MEDIA_SERVER_HOME
  mv usr/lib/plexmediaserver $PLEX_MEDIA_SERVER_HOME
  cd ~ ; rm -rf /tmp/runplex
}

if [ ! -x $PLEX_MEDIA_SERVER_HOME ]; then
  install_plex $PLEXVER > /tmp/runplex.log 2>&1
fi

rm -rf $PLEX_MEDIA_SERVER_TMPDIR && mkdir -p $PLEX_MEDIA_SERVER_TMPDIR

$PLEX_MEDIA_SERVER_HOME/Plex\ Media\ Server
