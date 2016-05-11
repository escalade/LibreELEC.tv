################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="eigen"
PKG_VERSION="3.2.8"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://eigen.tuxfamily.org/index.php?title=Main_Page"
PKG_URL="http://bitbucket.org/eigen/eigen/get/$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain systemd cmake:host"
PKG_PRIORITY="optional"
PKG_SECTION="emulators/depends"
PKG_SHORTDESC="eigen c++ headers"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

unpack() {
  tar -jxf $SOURCES/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.bz2 -C $BUILD
  mv $BUILD/eigen-eigen-07105f7124f9 $BUILD/$PKG_NAME-$PKG_VERSION
}

configure_target() {
  SYSROOT_PREFIX=$SYSROOT_PREFIX cmake -DCMAKE_TOOLCHAIN_FILE=$CMAKE_CONF \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_INSTALL_LIBDIR_NOARCH=/usr/lib \
        -DCMAKE_INSTALL_PREFIX_TOOLCHAIN=$SYSROOT_PREFIX/usr \
        -DCMAKE_PREFIX_PATH=$SYSROOT_PREFIX/usr \
        $EXTRA_CMAKE_OPTS \
        ..
}
