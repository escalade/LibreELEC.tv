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
PKG_VERSION="1.9"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="http://cffi.readthedocs.org"
PKG_URL="https://bitbucket.org/cffi/cffi/get/release-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain Python distutilscross:host pycparser libffi"
PKG_DEPENDS_HOST="toolchain Python:host libffi:host"
PKG_SECTION="python/devel"
PKG_SHORTDESC="Foreign Function Interface for Python calling C code"
PKG_IS_ADDON="no"

PKG_AUTORECONF="no"
PKG_MAINTAINER="unofficial.addon.pro"

post_unpack() {
  mv $BUILD/cffi-* $BUILD/$PKG_NAME-$PKG_VERSION
}

pre_build_host() {
  mkdir -p $PKG_BUILD/.$HOST_NAME
  cp -RP $PKG_BUILD/* $PKG_BUILD/.$HOST_NAME
}

pre_build_target() {
  mkdir -p $PKG_BUILD/.$TARGET_NAME
  cp -RP $PKG_BUILD/* $PKG_BUILD/.$TARGET_NAME
}

pre_make_host() {
  export CFLAGS="-I$ROOT/$TOOLCHAIN/include/python2.7 $CFLAGS"
  export LDSHARED="$CC -shared"
  cd .$HOST_NAME
}

pre_make_target() {
  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
  export LDFLAGS="$LDFLAGS -L$SYSROOT_PREFIX/usr/lib -L$SYSROOT_PREFIX/lib"
  export LDSHARED="$CC -shared"
  cd .$TARGET_NAME
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
  python setup.py install --prefix=$ROOT/$TOOLCHAIN
}

post_makeinstall_target() {
  find $INSTALL/usr/lib/python*/site-packages/  -name "*.py" -exec rm -rf {} ";"
}
