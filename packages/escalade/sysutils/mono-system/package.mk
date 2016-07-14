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

PKG_NAME="mono-system"
PKG_VERSION="4.0.5.1"
PKG_REV="100"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="http://www.mono-project.com"
PKG_URL="http://download.mono-project.com/sources/mono/${PKG_NAME%-*}-$PKG_VERSION.tar.bz2"
PKG_SOURCE_DIR="${PKG_NAME%-*}-${PKG_VERSION%.*}"
PKG_DEPENDS_TARGET="toolchain mono-system:host libgdiplus sqlite mono_sqlite zlib"
PKG_PRIORITY="optional"
PKG_SECTION="tools"
PKG_SHORTDESC="Cross platform, open source .NET framework"
PKG_LONGDESC="Mono ($PKG_VERSION) is a software platform designed to allow developers to easily create cross platform applications part of the .NET Foundation"
PKG_MAINTAINER="Anton Voyl (awiouy)"

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

prefix="/usr"
configure_opts="--prefix=$prefix         \
                --bindir=$prefix/bin     \
                --sysconfdir=$prefix/etc \
                --disable-boehm          \
                --without-mcs-docs"
PKG_CONFIGURE_OPTS_HOST="$configure_opts --disable-libraries --enable-static"
PKG_CONFIGURE_OPTS_TARGET="$configure_opts --disable-mcs-build"

pre_configure_host() {
  cp -PR ../* .
}

makeinstall_host() {
  : # nop
}

pre_configure_target() {
  cp -PR ../* .
}

makeinstall_target() {
  make -C "$ROOT/$PKG_BUILD/.$HOST_NAME" install DESTDIR="$INSTALL"
  make -C "$ROOT/$PKG_BUILD/.$TARGET_NAME" install DESTDIR="$INSTALL"
  rm -fr "$INSTALL/include"
  rm -fr "$INSTALL/share/man"
  $STRIP "$INSTALL/usr/bin/mono"
}
