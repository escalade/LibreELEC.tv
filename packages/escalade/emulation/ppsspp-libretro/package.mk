################################################################################
#      This file is part of LibreELEC - http://www.libreelec.tv
#      Copyright (C) 2009-2016 Lukas Rusak (lrusak@libreelec.tv)
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

PKG_NAME="ppsspp-libretro"
PKG_VERSION="5f7bcf7"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/libretro-ppsspp"
PKG_URL="custom"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="libretro"
PKG_SHORTDESC="Non-shallow fork of PPSSPP for libretro exclusively."
PKG_LONGDESC="A fast and portable PSP emulator"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

unpack() {
  git clone --recursive https://github.com/libretro/libretro-ppsspp $PKG_BUILD
  cd $PKG_BUILD
  git reset --hard $PKG_VERSION
  cd $ROOT
}

pre_configure_target() {
  strip_lto
}

make_target() {
  cd $ROOT/$PKG_BUILD/libretro
  if [ "$OPENGLES" == "gpu-viv-bin-mx6q" ]; then
    CFLAGS="$CFLAGS -DLINUX -DEGL_API_FB"
    CXXFLAGS="$CXXFLAGS -DLINUX -DEGL_API_FB"
  fi
  if [ "$ARCH" == "arm" ]; then
    SYSROOT_PREFIX=$SYSROOT_PREFIX make platform=imx6
  else
    make
  fi
  rm -rf ../.git
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp ../libretro/ppsspp_libretro.so $INSTALL/usr/lib/libretro/
}
