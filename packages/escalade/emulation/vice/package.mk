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

PKG_NAME="vice"
PKG_VERSION="2.4.29"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="http://vice-emu.sourceforge.net/"
PKG_URL="https://sourceforge.net/projects/vice-emu/files/development-releases/vice-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain alsa-lib SDL libpng giflib zlib libvorbis libogg"
PKG_PRIORITY="optional"
PKG_SECTION="emulation"
PKG_SHORTDESC="vice emulator"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="ac_cv_prog_sdl_config=$SYSROOT_PREFIX/usr/bin/sdl-config \
			   toolchain_check=no \
			   --prefix=/usr \
			   --disable-option-checking \
			   --disable-catweasel \
			   --enable-native-tools=$HOST_CC \
                           --enable-sdlui \
			   --without-oss \
			   --without-pulse"

pre_configure_target() {
  export LIBS="-ludev"
}

post_makeinstall_target() {
  # copy over scripts
  cp $PKG_DIR/scripts/* $INSTALL/usr/bin
  # rename the lib directory as OE has a lib64 symlink to lib
  if [ -d $INSTALL/usr/lib64 ]; then
    mv $INSTALL/usr/lib64 $INSTALL/usr/lib
  fi
  # copy over default config
  mkdir -p $INSTALL/etc
  cp $PKG_DIR/config/sdl-vicerc $INSTALL/etc/
 }
