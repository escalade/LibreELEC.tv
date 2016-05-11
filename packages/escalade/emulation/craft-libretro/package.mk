################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2012 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="craft-libretro"
PKG_VERSION="5cbaf79"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="MAME"
PKG_SITE="https://github.com/libretro/Craft"
PKG_URL="https://github.com/libretro/Craft/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_PRIORITY="optional"
PKG_SECTION="emulation"
PKG_SHORTDESC="libretro Craft core"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

unpack() {
  tar -zxf $SOURCES/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz -C $BUILD
  mv $BUILD/Craft* $BUILD/$PKG_NAME-$PKG_VERSION
}

pre_configure_target() {
  cd $ROOT/$PKG_BUILD
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
