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

PKG_NAME="desmume-libretro"
PKG_VERSION="3be0da9"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/desmume"
PKG_URL="https://github.com/libretro/desmume/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="emulation"
PKG_SHORTDESC="libretro wrapper for desmume NDS emulator."
PKG_LONGDESC="libretro wrapper for desmume NDS emulator."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

post_unpack() {
  mv $BUILD/desmume* $BUILD/$PKG_NAME-$PKG_VERSION
}

make_target() {
  if [ "$ARCH" == "arm" ]; then
    make -C desmume -f Makefile.libretro platform=armv # DESMUME_JIT_ARM=1
  else
    make -C desmume -f Makefile.libretro
  fi
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp desmume/desmume_libretro.so $INSTALL/usr/lib/libretro/
}
