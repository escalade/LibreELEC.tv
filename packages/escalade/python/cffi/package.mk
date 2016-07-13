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

PKG_NAME="cffi"
PKG_VERSION="1.7"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="http://cffi.readthedocs.org"
PKG_URL="https://bitbucket.org/cffi/cffi/get/release-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain Python distutilscross:host pycparser"
PKG_PRIORITY="optional"
PKG_SECTION="python/devel"
PKG_SHORTDESC="Foreign Function Interface for Python calling C code"
PKG_IS_ADDON="no"

PKG_AUTORECONF="no"
PKG_MAINTAINER="unofficial.addon.pro"

post_unpack() {
  mv $BUILD/cffi-* $BUILD/$PKG_NAME-$PKG_VERSION
}

pre_make_host() {
  export PKG_CONFIG_PATH=$SYSROOT_PREFIX/usr/lib/pkgconfig
}

pre_make_target() {
  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
  export LDFLAGS="$LDFLAGS -L$SYSROOT_PREFIX/usr/lib -L$SYSROOT_PREFIX/lib"
  export LDSHARED="$CC -shared"
}

make_host() {
  python setup.py build
}

make_target() {
  python setup.py build --cross-compile
}

makeinstall_target() {
  python setup.py install --root=$INSTALL --prefix=/usr
}

makeinstall_host() {
  python setup.py install --root=$ROOT/$TOOLCHAIN --prefix=/usr
}

post_makeinstall_target() {
  find $INSTALL/usr/lib/python*/site-packages/  -name "*.py" -exec rm -rf {} ";"
}
