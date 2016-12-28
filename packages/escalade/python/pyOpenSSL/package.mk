###############################################################################
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

PKG_NAME="pyOpenSSL"
PKG_VERSION="16.2.0"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="LGPL"
PKG_SITE="https://pypi.python.org/pypi/pyOpenSSL"
PKG_URL="https://github.com/pyca/pyopenssl/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="pyopenssl-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain Python distutilscross:host libressl cryptography"
PKG_SECTION="python/security"
PKG_SHORTDESC="pyOpenSSL: Python interface to the OpenSSL library"
PKG_LONGDESC="Python interface to the OpenSSL library. Includes: SSL Context objects, SSL Connection objects, using Python sockets as transport layer. The Connection object wraps all the socket methods and can therefore be used interchangeably."
PKG_IS_ADDON="no"

PKG_AUTORECONF="no"

PKG_MAINTAINER="unofficial.addon.pro"

make_target() {
  : # nop
}

makeinstall_target() {
  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
  export LDFLAGS="$LDFLAGS -L$SYSROOT_PREFIX/usr/lib -L$SYSROOT_PREFIX/lib"
  export LDSHARED="$CC -shared"

  python setup.py build --cross-compile
  python setup.py install --root=$INSTALL --prefix=/usr

  rm -rf $INSTALL/usr/bin
  find $INSTALL/usr/lib/python*/site-packages/  -name "*.py" -exec rm -rf {} ";"
}
