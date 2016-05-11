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

PKG_NAME="xfsprogs-dev"
PKG_VERSION="53cefc4"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.xfs.org"
PKG_URL="https://git.kernel.org/cgit/fs/xfs/xfsprogs-dev.git/snapshot/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain util-linux"
PKG_DEPENDS_INIT="xfsprogs-dev"
PKG_PRIORITY="optional"
PKG_SECTION="tools"
PKG_SHORTDESC="xfsprogs: Utilities for use with the xfs filesystem"
PKG_IS_ADDON="no"

PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="--enable-shared=no --with-gnu-ld --host=$TARGET_NAME --build=$HOST_NAME"

pre_configure_target() {
  cd $ROOT/$PKG_BUILD
  rm -rf $TARGET_NAME
  make configure
}

configure_init() {
  : # reuse target
}

make_init() {
  : # reuse target
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr/include
}

makeinstall_init() {
  mkdir -p $INSTALL/sbin
  cp ../.install_pkg/sbin/xfs_repair $INSTALL/sbin
  cp ../.install_pkg/sbin/fsck.xfs $INSTALL/sbin
  cp ../.install_pkg/sbin/mkfs.xfs $INSTALL/sbin
}
