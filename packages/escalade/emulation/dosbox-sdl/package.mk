################################################################################
#      This file is part of LibreELEC - https://LibreELEC.tv
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

PKG_NAME="dosbox-sdl"
PKG_VERSION="501eeaa"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://www.dosbox.com"
PKG_URL="https://github.com/escalade/dosbox/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain alsa-lib SDL SDL_net SDL_sound munt libpng"
PKG_PRIORITY="optional"
PKG_SECTION="emulation"
PKG_SHORTDESC="DOSBox emulator"

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

unpack() {
  tar -zxf $SOURCES/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz -C $BUILD
  mv $BUILD/${PKG_NAME%-*}-$PKG_VERSION* $BUILD/$PKG_NAME-$PKG_VERSION
}

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr \
			   --enable-core-inline \
                           --enable-dynrec \
			   --enable-unaligned_memory \
                           --disable-opengl \
                           --with-sdl-prefix=$SYSROOT_PREFIX/usr"

pre_make_target() {
  if [[ "$PROJECT" =~ "RPi" ]]; then
    sed -i s/C_TARGETCPU.*/C_TARGETCPU\ ARMV7LE/g config.h
  fi
  sed -i s/SVN/SDL/g config.h
}
