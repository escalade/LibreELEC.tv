################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
#      Copyright (C) 2016 Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="plexmediaserver"
PKG_VERSION="1.0.3.2461"
PKG_REV="35f0caa"
PKG_ARCH="any"
PKG_LICENSE="Freemium"
PKG_SITE="http://plex.tv"
PKG_SECTION="service"
PKG_SHORTDESC="Plex Media Server"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

case $ARCH in
  x86_64)
    PKG_URL="https://downloads.plex.tv/plex-media-server/$PKG_VERSION-$PKG_REV/$PKG_NAME-$PKG_VERSION-$PKG_REV.x86_64.rpm"
    ;;
  arm)
    PKG_URL="https://downloads.plex.tv/plex-media-server/$PKG_VERSION-$PKG_REV/PlexMediaServer-$PKG_VERSION-$PKG_REV-arm7.spk"
    ;;
esac

unpack() {
  mkdir -p $PKG_BUILD
}

make_target() {
  : # nop
}

makeinstall_target() {
  mkdir -p $INSTALL/opt
  mkdir -p $INSTALL/usr/config

case $ARCH in
  x86_64)
    rpm2cpio $ROOT/$SOURCES/$PKG_NAME/$PKG_SOURCE_NAME | bsdtar -xf -
    ;;
  arm)
    tar -xf $ROOT/$SOURCES/$PKG_NAME/$PKG_SOURCE_NAME
    mkdir -p usr/lib/plexmediaserver
    tar -zxf package.tgz -C usr/lib/plexmediaserver/
    ;;
esac
    cp -dr usr/lib/plexmediaserver $INSTALL/opt/
    cp $PKG_DIR/config/plexmediaserver.conf $INSTALL/usr/config/
}
