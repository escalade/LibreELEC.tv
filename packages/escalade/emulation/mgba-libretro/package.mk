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

PKG_NAME="mgba-libretro"
PKG_VERSION="def5a46"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="MPLv2.0"
PKG_SITE="https://github.com/libretro/mgba"
PKG_URL="https://github.com/libretro/mgba/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="emulation"
PKG_SHORTDESC="mGBA Game Boy Advance Emulator"
PKG_LONGDESC="mGBA is a new emulator for running Game Boy Advance games. It aims to be faster and more accurate than many existing Game Boy Advance emulators, as well as adding features that other emulators lack."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_USE_CMAKE="no"

post_unpack() {
  mv $BUILD/mgba-* $BUILD/$PKG_NAME-$PKG_VERSION
}

pre_configure_target() {
  cd ..
  rm -rf .$TARGET_NAME
}

make_target() {
  case $PROJECT in
    RPi*)
      make -f Makefile.libretro platform=unix-armv HAVE_NEON=1
      ;;
    Generic)
      make -f Makefile.libretro
      ;;
  esac
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp mgba_libretro.so $INSTALL/usr/lib/libretro/
}
