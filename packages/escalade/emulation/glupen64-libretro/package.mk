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

PKG_NAME="glupen64-libretro"
PKG_VERSION="7ad376e"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/loganmc10/GLupeN64"
PKG_URL="custom"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="emulation"
PKG_SHORTDESC="mupen64plus + RSP-HLE + GLideN64 + libretro"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

unpack() {
  git clone --recursive https://github.com/loganmc10/GLupeN64.git $PKG_BUILD
  cd $PKG_BUILD
  git reset --hard $PKG_VERSION
  cd $ROOT
}

pre_build_target() {
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
    Generic)
      make
      ;;
  esac
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp glupen64_libretro.so $INSTALL/usr/lib/libretro/
}
