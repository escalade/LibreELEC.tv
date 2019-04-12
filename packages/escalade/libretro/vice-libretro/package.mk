# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019 Trond Haugland (trondah@gmail.com)

PKG_NAME="vice-libretro"
PKG_VERSION="ce4524d"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="http://vice-emu.sf.net"
PKG_URL="https://github.com/libretro/vice-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="emulation"
PKG_SHORTDESC="VICE C64 libretro"
PKG_TOOLCHAIN="make"

make_target() {
  make -f Makefile.libretro CC=$CC GIT_VERSION=$PKG_VERSION
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp *.so $INSTALL/usr/lib/libretro/
}
