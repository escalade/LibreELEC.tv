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

PKG_NAME="dolphin"
PKG_VERSION="4c004b6"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/dolphin-emu/dolphin"
PKG_URL="https://github.com/dolphin-emu/dolphin/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain cmake:host openal-soft libevdev gtk+ ffmpeg zlib bluez portaudio pulseaudio alsa-lib libogg libvorbis libSM"
PKG_PRIORITY="optional"
PKG_SECTION="emulation"
PKG_SHORTDESC="Dolphin GameCube/Wii emulator"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

configure_target() {
  cmake -DCMAKE_TOOLCHAIN_FILE=$CMAKE_CONF \
        -DCMAKE_PREFIX_PATH=$SYSROOT_PREFIX/usr \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DPORTAUDIO_EXITCODE=0 \
        ..
}

post_makeinstall_target() {
  cp $PKG_DIR/scripts/* $INSTALL/usr/bin/
  mkdir -p $INSTALL/usr/config/dolphin-emu
  cp -PR $PKG_DIR/config/* $INSTALL/usr/config/dolphin-emu/
}
