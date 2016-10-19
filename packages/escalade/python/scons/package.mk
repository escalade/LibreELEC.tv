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

PKG_NAME="scons"
PKG_VERSION="2.5.0"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="http://www.scons.org"
PKG_URL="http://prdownloads.sourceforge.net/scons/scons-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="toolchain Python:host"
PKG_SECTION="python"
PKG_SHORTDESC="scons"
PKG_IS_ADDON="no"

PKG_AUTORECONF="no"

pre_make_host() {
  export CFLAGS="-I$ROOT/$TOOLCHAIN/include/python2.7 $CFLAGS"
  export LDSHARED="$CC -shared"
}

make_host() {
  python setup.py build
}

makeinstall_host() {
  python setup.py install --prefix=$ROOT/$TOOLCHAIN
}
