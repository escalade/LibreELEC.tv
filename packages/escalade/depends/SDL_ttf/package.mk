################################################################################
#      This file is NOT part of OpenELEC - http://www.openelec.tv
#
# This package is under the MIT License (MIT).
#
# Copyright (c) 2014 Jean-Matthieu COULON
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
#
# The SDL_ttf source code has its own license and is copyright Sam Lantinga
#
################################################################################

PKG_NAME="SDL_ttf"
PKG_VERSION="2.0.11"
PKG_REV="0"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.libsdl.org/"
PKG_URL="http://www.libsdl.org/projects/SDL_ttf/release/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain SDL freetype"
PKG_PRIORITY="optional"
PKG_SECTION="emulators/depends"
PKG_SHORTDESC="libsdl_ttf: TTF rendering for SDL"
PKG_LONGDESC="This is a sample library which allows you to use TrueType fonts in your SDL applications."
PKG_IS_ADDON="yes"
PKG_ADDON_TYPE="xbmc.python.pluginsource"

PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="--with-gnu-ld \
			   --with-freetype-prefix=$SYSROOT_PREFIX/usr \
                           --with-sdl-prefix=$SYSROOT_PREFIX/usr"

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
  cp -P $PKG_BUILD/.install_pkg/usr/lib/* $ADDON_BUILD/$PKG_ADDON_ID/lib
  cp -P $PKG_BUILD/.install_pkg/usr/lib/* $TOOLCHAIN/lib
}

