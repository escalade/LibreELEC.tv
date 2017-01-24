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

PKG_NAME="emby-system"
PKG_VERSION="3.0.5986"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="http://emby.media"
PKG_URL="https://github.com/MediaBrowser/Emby/releases/download/$PKG_VERSION/Emby.Mono.zip"
PKG_DEPENDS_TARGET="toolchain mono-system imagemagick"
PKG_SECTION="service"
PKG_SHORTDESC="Emby: a personal media server"
PKG_LONGDESC="Emby ($PKG_VERSION) brings your home videos, music, and photos together, automatically converting and streaming your media on-the-fly to any device"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

unpack() {
  mkdir -p $PKG_BUILD
}

make_target() {
  : # nop
}

makeinstall_target() {
  mkdir -p $INSTALL/opt/emby
  unzip -q $ROOT/$SOURCES/$PKG_NAME/$PKG_SOURCE_NAME -d $INSTALL/opt/emby
}
