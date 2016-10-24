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

PKG_NAME="reicast"
PKG_VERSION="d8a7212"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/reicast/reicast-emulator"
PKG_URL="https://github.com/reicast/reicast-emulator/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain alsa-utils"
PKG_SECTION="emulation"
PKG_SHORTDESC="Reicast is a multi-platform Sega Dreamcast emulator"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

post_unpack() {
  mv $BUILD/reicast-emulator-$PKG_VERSION* $BUILD/$PKG_NAME-$PKG_VERSION
}

make_target() {
  strip_lto
  cd shell/linux
  case $PROJECT in
    RPi2)
      make CC=$CC CXX=$CXX AS=$AS STRIP=$STRIP SYSROOT_PREFIX=$SYSROOT_PREFIX platform=rpi2
      ;;
    Generic)
      make CC=$CC CXX=$CXX AS=$AS STRIP=$STRIP SYSROOT_PREFIX=$SYSROOT_PREFIX platform=x64
      ;;
  esac
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp reicast.elf $INSTALL/usr/bin/reicast
  cp $PKG_DIR/scripts/* $INSTALL/usr/bin/
}
