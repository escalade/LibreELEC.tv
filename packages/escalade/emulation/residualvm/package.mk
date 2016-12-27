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

PKG_NAME="residualvm"
PKG_VERSION="36145d3"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/residualvm/residualvm"
PKG_URL="https://github.com/residualvm/residualvm/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain SDL2 libmpeg2 flac libogg libmad libjpeg-turbo libpng zlib alsa-lib freetype"
PKG_SECTION="emulation"
PKG_SHORTDESC="Game engine reimplementation of Grim Fandango, Escape from Monkey Island and Myst III"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

if [ "$PROJECT" = "Generic" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET glew glu"
  GLEW="--enable-glew"
fi

TARGET_CONFIGURE_OPTS="--prefix=/usr \
		       --host=$TARGET_NAME \
                       --with-sdl-prefix=$SYSROOT_PREFIX/usr \
		       --with-freetype2-prefix=$SYSROOT_PREFIX/usr \
		       --disable-debug \
		       --enable-opengl-shaders \
		       $GLEW \
		       --enable-release \
		       --enable-vkeybd \
		       --enable-keymapper \
		       --enable-flac \
		       --enable-verbose-build"

pre_configure_target() {
  export SDL_CONFIG=sdl2-config
  sed -i -e 's/^_as=.*/_as=$AS/' ../configure
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr/share/icons
  rm -rf $INSTALL/usr/share/pixmaps
  cp $PKG_DIR/scripts/* $INSTALL/usr/bin/
}
