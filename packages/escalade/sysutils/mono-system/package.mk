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
PKG_VERSION="4.6.2.7"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="http://www.mono-project.com"
PKG_URL="http://download.mono-project.com/sources/mono/${PKG_NAME%-*}-$PKG_VERSION.tar.bz2"
PKG_SOURCE_DIR="${PKG_NAME%-*}-${PKG_VERSION%.*}"
PKG_DEPENDS_TARGET="toolchain mono-system:host libgdiplus sqlite zlib"
PKG_SECTION="tools"
PKG_SHORTDESC="Cross platform, open source .NET framework"
PKG_LONGDESC="Mono ($PKG_VERSION) is a software platform designed to allow developers to easily create cross platform applications part of the .NET Foundation"
PKG_MAINTAINER="Anton Voyl (awiouy)"

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

prefix="/usr"
options="--build=$HOST_NAME \
         --prefix=$prefix \
         --bindir=$prefix/bin \
         --sbindir=$prefix/sbin \
         --sysconfdir=$prefix/etc \
         --libexecdir=$prefix/lib \
         --localstatedir=/var \
         --disable-boehm \
         --disable-libraries \
         --without-mcs-docs"

configure_host() {
  cp -PR ../* .
  ./configure $options --host=$HOST_NAME
}

makeinstall_host() {
  : # nop
}

pre_configure_target() {
  strip_lto
}

configure_target() {
  cp -PR ../* .
  ./configure $options --host=$TARGET_NAME \
                       --disable-mcs-build
}

makeinstall_target() {
  export MAKEFLAGS="-j1"
  make -C "$ROOT/$PKG_BUILD/.$HOST_NAME" install DESTDIR="$INSTALL"
  make -C "$ROOT/$PKG_BUILD/.$TARGET_NAME" install DESTDIR="$INSTALL"
  $STRIP "$INSTALL/usr/bin/mono"
}
