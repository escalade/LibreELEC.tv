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

PKG_NAME="Cheetah"
PKG_VERSION="2.4.4"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="http://www.cheetahtemplate.org/"
PKG_URL="http://pypi.python.org/packages/source/C/Cheetah/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python distutilscross:host"
PKG_SECTION="python/devel"
PKG_SHORTDESC="cheetah: Python-powered template engine and code generator"
PKG_LONGDESC="Cheetah is a Python-powered template engine and code generator. It can be used as a standalone utility or it can be combined with other tools. Cheetah has many potential uses, but web developers looking for a viable alternative to ASP, JSP, PHP and PSP are expected to be its principle user group."
PKG_IS_ADDON="no"

PKG_AUTORECONF="no"

PKG_MAINTAINER="unofficial.addon.pro"

pre_make_target() {
  export PYTHONXCPREFIX="$SYSROOT_PREFIX/usr"
  export LDFLAGS="$LDFLAGS -L$SYSROOT_PREFIX/usr/lib -L$SYSROOT_PREFIX/lib"
  export LDSHARED="$CC -shared"
}

make_target() {
  python setup.py build --cross-compile
}

makeinstall_target() {
  python setup.py install --root=$INSTALL --prefix=/usr
}

post_makeinstall_target() {
  find $INSTALL/usr/lib/python*/site-packages/  -name "*.py" -exec rm -rf {} ";"
  rm -rf $INSTALL/usr/lib/python*/site-packages/*/tests
}
