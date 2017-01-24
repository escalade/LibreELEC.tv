################################################################################
#      This file is part of LibreELEC - https://LibreELEC.tv
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

PKG_NAME="uae4arm-sdl2"
PKG_VERSION="36d98b9"
PKG_ARCH="arm"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/midwan/uae4arm-rpi"
PKG_URL="https://github.com/midwan/uae4arm-rpi/archive/sdl2/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="uae4arm-rpi-sdl2"
PKG_DEPENDS_TARGET="toolchain alsa-lib freetype zlib SDL2 SDL2_image libpng flac mpg123 guisan"
PKG_SECTION="emulation"
PKG_SHORTDESC="Amiga emulator optimized for Raspberry Pi"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  case $PROJECT in
    RPi)
      make PLATFORM=rpi1 CXX=$CXX STRIP=$STRIP SYSROOT_PREFIX=$SYSROOT_PREFIX
      ;;
    RPi2)
      make PLATFORM=rpi2 CXX=$CXX STRIP=$STRIP SYSROOT_PREFIX=$SYSROOT_PREFIX
      ;;
  esac
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp $ROOT/$PKG_BUILD/uae4arm $INSTALL/usr/bin
  cp $PKG_DIR/scripts/* $INSTALL/usr/bin
  mkdir -p $INSTALL/usr/config
  cp -R $PKG_DIR/config $INSTALL/usr/config/uae4arm
  cp -R data 		$INSTALL/usr/config/uae4arm/
  ln -s /storage/roms/bios $INSTALL/usr/config/uae4arm/kickstarts
 }
