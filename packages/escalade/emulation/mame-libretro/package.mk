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

PKG_NAME="mame-libretro"
PKG_VERSION="eb83bd9"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="MAME"
PKG_SITE="https://github.com/libretro/mame"
PKG_URL="https://github.com/libretro/mame/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="mame-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="emulation"
PKG_SHORTDESC="MAME - Multiple Arcade Machine Emulator"
PKG_LONGDESC="MAME - Multiple Arcade Machine Emulator"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_make_target() {
  strip_lto
}

make_target() {
  case $PROJECT in
    RPi)
      make platform=armv6-hardfloat-arm1176jzf-s
      ;;
    RPi2)
      make platform=armv7-neon-hardfloat-cortex-a7
      ;;
    imx6)
      make platform=armv7-neon-hardfloat-cortex-a9
      ;;
    WeTek_Play)
      make platform=armv7-neon-hardfloat-cortex-a9
      ;;
    Generic)
      unset ARCH
      make OSD="retro" verbose=1 RETRO=1 NOWERROR=1 OS="linux" TARGETOS="linux" CONFIG="libretro" NO_USE_MIDI="1" PTR64=1 TARGET=mame CC=$CC CXX=$CXX LD=$LD -j5
      ;;
  esac
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp *_libretro.so $INSTALL/usr/lib/libretro/mame_libretro.so
}
