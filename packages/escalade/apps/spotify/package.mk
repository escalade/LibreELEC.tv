################################################################################
#      This file is part of LibreELEC - http://www.libreelec.tv
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

PKG_NAME="spotify"
PKG_VERSION="latest"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="Freeware"
PKG_SITE="http://www.spotify.com"
PKG_URL="custom"
PKG_DEPENDS_TARGET="toolchain gtk+ libX11 openssl-compat libcurl-compat freetype zlib"
PKG_SECTION="apps"
PKG_SHORTDESC="A proprietary music streaming service"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

unpack() {
  mkdir -p $PKG_BUILD
}

make_target() {
  :
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp $PKG_DIR/files/spotify $INSTALL/usr/bin/
}
