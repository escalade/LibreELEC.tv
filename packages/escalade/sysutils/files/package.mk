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

PKG_NAME="files"
PKG_VERSION="1.0"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="system"
PKG_SHORTDESC="Custom files"
PKG_LONGDESC="This package copies the contents of the files directory to the image"
PKG_AUTORECONF="no"
PKG_IS_ADDON="no"

make_target() {
  :
}

makeinstall_target() {
  mkdir -p $INSTALL
  case $PROJECT in
    "Generic")
      test -d $ROOT/files/$PROJECT && cp -PRv $ROOT/files/$PROJECT/* $INSTALL/
    ;;
    "RPi*")
      test -d $ROOT/files/$PROJECT && cp -PRv $ROOT/files/$PROJECT/* $INSTALL/
    ;;
  esac
  test -d $ROOT/files/any && cp -PRv $ROOT/files/any/* $INSTALL/
}
