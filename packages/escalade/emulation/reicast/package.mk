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
PKG_VERSION="ca837e1"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/reicast/reicast-emulator"
PKG_URL="https://github.com/reicast/reicast-emulator/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="reicast-emulator-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain alsa-utils"
PKG_SECTION="emulation"
PKG_SHORTDESC="Reicast is a multi-platform Sega Dreamcast emulator"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  cd shell/linux
  case $PROJECT in
    RPi2)
      make CC=$CC CXX=$CXX AS=$CC STRIP=$STRIP platform=rpi2 reicast.elf
      ;;
    Generic)
      make CC=$CC CXX=$CXX AS=$CC STRIP=$STRIP platform=x64 reicast.elf
      ;;
  esac
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp reicast.elf $INSTALL/usr/bin/reicast
  cp tools/reicast-joyconfig.py $INSTALL/usr/bin/
  cp $PKG_DIR/scripts/* $INSTALL/usr/bin/
}

postinstall_target() {
  enable_service reicast-biosdir.service
}
