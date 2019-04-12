# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019 Trond Haugland (trondah@gmail.com)

PKG_NAME="reicast-libretro"
PKG_VERSION="1d74780"
PKG_ARCH="x86_64 arm"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/reicast-emulator"
PKG_URL="https://github.com/libretro/reicast-emulator/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="reicast-emulator-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="libretro"
PKG_SHORTDESC="Reicast is a multiplatform Sega Dreamcast emulator"
PKG_TOOLCHAIN="manual"
PKG_BUILD_FLAGS="-gold"

make_target() {
  mkdir -p out
  case $PROJECT in
    RPi)
      make GIT_VERSION=$PKG_VERSION WITH_DYNAREC=$ARCH FORCE_GLES=1 platform=rpi2
      mv *.so out
      ;;
    OdroidXU3)
      make GIT_VERSION=$PKG_VERSION WITH_DYNAREC=$ARCH platform=odroid BOARD=ODROID-XU4
      mv *.so out
      ;;
    Generic)
      make AS=${AS} CC_AS=${AS} HAVE_OIT=1 GIT_VERSION=$PKG_VERSION WITH_DYNAREC=$ARCH
      mv *.so out
      ;;
  esac
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp out/*.so $INSTALL/usr/lib/libretro/
}
