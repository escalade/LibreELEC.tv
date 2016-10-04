################################################################################
#      This file is part of LibreELEC - http://www.libreelec.tv
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

PKG_NAME="xfsprogs"
PKG_VERSION="4.7.0"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.xfs.org"
PKG_URL="ftp://oss.sgi.com/projects/xfs/cmd_tars/xfsprogs-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain util-linux netbsd-curses"
PKG_DEPENDS_INIT="xfsprogs"
PKG_SECTION="tools"
PKG_SHORTDESC="xfsprogs: Utilities for use with the xfs filesystem"
PKG_IS_ADDON="no"

PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="--enable-shared=no --with-gnu-ld --enable-readline=yes --enable-termcap=yes"

pre_configure_target() {
  cd ..
  rm -rf .$TARGET_NAME
}

configure_init() {
  : # reuse target
}

make_init() {
  : # reuse target
}

makeinstall_init() {
  mkdir -p $INSTALL/sbin
  cp ../.install_pkg/sbin/xfs_repair $INSTALL/sbin
  cp ../.install_pkg/sbin/fsck.xfs $INSTALL/sbin
  cp ../.install_pkg/sbin/mkfs.xfs $INSTALL/sbin
}
