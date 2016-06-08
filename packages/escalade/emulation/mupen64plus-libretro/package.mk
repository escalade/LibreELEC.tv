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

PKG_NAME="mupen64plus-libretro"
PKG_VERSION="6f4824f"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/mupen64plus-libretro"
PKG_URL="https://github.com/libretro/mupen64plus-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="emulation"
PKG_SHORTDESC="Libretro GL only. Libretro port of Mupen64 Plus."
PKG_LONGDESC="Libretro GL only. Libretro port of Mupen64 Plus."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_configure_target() {
  strip_gold
  strip_lto
}

make_target() {
  case $PROJECT in
    RPi)
      make platform=rpi
      ;;
    RPi2)
      make platform=rpi2
      ;;
    imx6)
      make platform=imx6
      ;;
    WeTek_Play)
      make platform=armv7-neon-gles-cortex-a9
      ;;
    Generic)
      make WITH_DYNAREC=$TARGET_ARCH
      ;;
  esac
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp mupen64plus_libretro.so $INSTALL/usr/lib/libretro/mupen64plus_libretro.so
}
