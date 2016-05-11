################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2012 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="vice"
PKG_VERSION="2.4.27"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="http://vice-emu.sourceforge.net/"
PKG_URL="https://sourceforge.net/projects/vice-emu/files/development-releases/vice-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain alsa-lib SDL libpng giflib zlib libvorbis"
PKG_PRIORITY="optional"
PKG_SECTION="emulation"
PKG_SHORTDESC="vice emulator"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="ac_cv_func_SDL_NumJoysticks=yes --prefix=/usr \
			   --disable-option-checking \
			   --enable-native-tools \
                           --enable-sdlui \
			   --without-oss \
			   --without-pulse"

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
