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

PKG_NAME="craft-libretro"
PKG_VERSION="ccf83df"
PKG_ARCH="any"
PKG_LICENSE="MAME"
PKG_SITE="https://github.com/libretro/Craft"
PKG_URL="https://github.com/libretro/Craft/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_SECTION="emulation"
PKG_SHORTDESC="libretro Craft core"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_USE_CMAKE="no"

post_unpack() {
  mv $BUILD/Craft* $BUILD/$PKG_NAME-$PKG_VERSION
}

pre_configure_target() {
  cd ..
  rm -rf .$TARGET_NAME
}

make_target() {
  case $PROJECT in
    RPi)
      make -f Makefile.libretro platform=rpi
      ;;
    RPi2)
      make -f Makefile.libretro platform=rpi2
      ;;
    Generic)
      make -f Makefile.libretro
      ;;
  esac
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp craft_libretro.so $INSTALL/usr/lib/libretro/
}
