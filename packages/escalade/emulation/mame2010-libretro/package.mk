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

PKG_NAME="mame2010-libretro"
PKG_VERSION="abdabbe"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/mame2010-libretro"
PKG_URL="https://github.com/libretro/mame2010-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="libretro"
PKG_SHORTDESC="Late 2010 version of MAME (0.139) for libretro and MAME 0.139 romsets"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_make_target() {
  export CFLAGS="$CFLAGS -fpermissive"
  export CXXFLAGS="$CXXFLAGS -fpermissive"
  export LD="$CXX"
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
    Odroid_C2|WeTek_Hub|WeTek_Play_2)
      make platform=aarch64
      ;;
    Generic)
      make
      ;;
  esac
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp mame2010_libretro.so $INSTALL/usr/lib/libretro/
}
