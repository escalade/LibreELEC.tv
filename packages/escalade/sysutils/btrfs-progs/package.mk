################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
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

PKG_NAME="btrfs-progs"
PKG_VERSION="v4.8.2"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/kdave/btrfs-progs"
PKG_URL="https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/btrfs-progs-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain e2fsprogs util-linux zlib lzo"
PKG_DEPENDS_INIT="btrfs-progs"
PKG_PRIORITY="optional"
PKG_SECTION="tools"
PKG_SHORTDESC="f2fs-tools: Utilities for use with the f2fs filesystem"
PKG_LONGDESC="The filesystem utilities for the f2fs filesystem"
PKG_IS_ADDON="no"

PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr \
                           --disable-option-checking \
                           --disable-documentation"

pre_configure_target() {
  cd ..
  rm -rf $TARGET_NAME
}

configure_init() {
  : # reuse target
}

make_init() {
  : # reuse target
}

makeinstall_init() {
  mkdir -p $INSTALL/sbin
  cp ../.install_pkg/usr/bin/btrfs $INSTALL/sbin
  cp ../.install_pkg/usr/bin/fsck.btrfs $INSTALL/sbin
  cp ../.install_pkg/usr/bin/mkfs.btrfs $INSTALL/sbin
}
