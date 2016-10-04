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

PKG_NAME="dosbox-sdl"
PKG_VERSION="4000"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://www.dosbox.com"
PKG_DEPENDS_TARGET="toolchain alsa-lib SDL SDL_net SDL_sound munt libpng"
PKG_SECTION="emulation"
PKG_SHORTDESC="DOSBox emulator"

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

unpack() {
  svn checkout -r $PKG_VERSION svn://svn.code.sf.net/p/dosbox/code-0/dosbox/trunk $PKG_BUILD
}

PKG_CONFIGURE_OPTS_TARGET="--prefix=/usr \
			   --enable-core-inline \
                           --enable-dynrec \
			   --enable-unaligned_memory \
                           --disable-opengl \
                           --with-sdl-prefix=$SYSROOT_PREFIX/usr"

if [[ "$PROJECT" =~ "RPi" ]]; then
  PKG_CONFIGURE_OPTS_TARGET="$PKG_CONFIGURE_OPTS_TARGET ac_cv_lib_X11_main=no"
fi

pre_make_target() {
  if [[ "$PROJECT" =~ "RPi" ]]; then
    sed -i s/C_TARGETCPU.*/C_TARGETCPU\ ARMV7LE/g config.h
  fi
  sed -i s/SVN/SDL/g config.h
}

post_makeinstall_target() {
  cp $PKG_DIR/scripts/* $INSTALL/usr/bin/
}
