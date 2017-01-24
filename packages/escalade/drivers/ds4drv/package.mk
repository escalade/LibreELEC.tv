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

PKG_NAME="ds4drv"
PKG_VERSION="fc00652"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="https://github.com/chrippa/ds4drv"
PKG_URL="https://github.com/chrippa/ds4drv/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python distutilscross:host evdev pyudev setuptools"
PKG_SECTION="python/devel"
PKG_SHORTDESC="Sony DualShock 4 userspace driver for Linux."
PKG_IS_ADDON="no"

PKG_AUTORECONF="no"

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
  sed -i -e "s/^#\!.*/#\!\/usr\/bin\/python/" $INSTALL/usr/bin/ds4drv
  mkdir -p $INSTALL/usr/config
  cp ds4drv.conf $INSTALL/usr/config/
}
