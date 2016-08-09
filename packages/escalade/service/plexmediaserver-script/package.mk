################################################################################
#      This file is part of LibreELEC - http://www.libreelec.tv
#      Copyright (C) 2009-2016 Lukas Rusak (lrusak@libreelec.tv)
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

PKG_NAME="plexmediaserver-script"
PKG_VERSION="1.0"
PKG_REV="1"
PKG_ARCH="x86_64 arm"
PKG_LICENSE="GPL"
PKG_SITE="https://plex.tv"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="service"
PKG_SHORTDESC="Script to download and run Plex Media Server"
PKG_AUTORECONF="no"
PKG_IS_ADDON="no"

make_target() {
  :
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp $PKG_DIR/files/runplex.sh $INSTALL/usr/bin/
}
