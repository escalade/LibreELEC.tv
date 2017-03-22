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

PKG_NAME="libvlc"
PKG_VERSION="2.2.4"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.videolan.org"
PKG_URL="http://get.videolan.org/vlc/$PKG_VERSION/vlc-$PKG_VERSION.tar.xz"
PKG_SOURCE_DIR="vlc-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain ffmpeg2 libmad"
PKG_SECTION="escalade/depends"
PKG_SHORTDESC="VLC library"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="--disable-lua --disable-a52 --disable-vlc"

pre_configure_target() {
  export PKG_CONFIG_PATH=$SYSROOT_PREFIX/usr/lib/ffmpeg2/pkgconfig
  strip_lto
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
  rm -rf $INSTALL/usr/share
  rm -rf $INSTALL/usr/lib/vlc/plugins/[video_filter,visualization]
}
