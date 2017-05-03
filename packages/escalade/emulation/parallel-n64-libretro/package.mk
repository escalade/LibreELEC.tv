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

PKG_NAME="parallel-n64-libretro"
PKG_VERSION="571a477"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/parallel-n64"
PKG_URL="https://github.com/libretro/parallel-n64/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="parallel-n64-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="emulation"
PKG_SHORTDESC="mupen64plus for libretro with multiple graphic plugins and vulkan support"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_configure_target() {
  strip_lto
}

pre_build_target() {
  export GIT_VERSION=$PKG_VERSION
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
      make WITH_DYNAREC=$TARGET_ARCH HAVE_PARALLEL=0
      ;;
  esac
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp *.so $INSTALL/usr/lib/libretro/
}
