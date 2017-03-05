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

PKG_NAME="SDL_sound"
PKG_VERSION="719dade41745"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://www.icculus.org/SDL_sound/"
PKG_URL="http://hg.icculus.org/icculus/SDL_sound/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="SDL_sound-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain alsa-lib SDL2"
PKG_SECTION="emulators/depends"
PKG_SHORTDESC="SDL_sound library"

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr \
			   --disable-speex \
			   ac_cv_path_SDL2_CONFIG=$SYSROOT_PREFIX/usr/bin/sdl2-config"

post_unpack() {
  touch $PKG_BUILD/README
}

post_makeinstall_target() {
  ln -sf $SYSROOT_PREFIX/usr/include/SDL/SDL_sound.h $SYSROOT_PREFIX/usr/include/SDL2/SDL_sound.h
}
