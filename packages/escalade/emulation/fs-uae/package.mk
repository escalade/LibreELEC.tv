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

PKG_NAME="fs-uae"
PKG_VERSION="9a69ecf"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/FrodeSolheim/fs-uae"
PKG_URL="https://github.com/FrodeSolheim/fs-uae/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain SDL2 glew glu libmpeg2 libXi openal-soft"
PKG_SECTION="emulation"
PKG_SHORTDESC="FS-UAE amiga emulator."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_configure_target() {
  cd $ROOT/$PKG_BUILD
  ./bootstrap
  export ac_cv_func_realloc_0_nonnull=yes
}

make_target() {
  make SYSROOT_PREFIX=$SYSROOT_PREFIX
}

post_makeinstall_target() {
  # install scripts
  cp $PKG_DIR/scripts/* $INSTALL/usr/bin/

  # set up default config directory
  mkdir -p $INSTALL/usr/config
  cp -R $PKG_DIR/config $INSTALL/usr/config/fs-uae
  ln -s /storage/roms/bios $INSTALL/usr/config/fs-uae/Kickstarts

  # install capsimg plugin for ipf support
  wget https://fs-uae.net/devel/plugins/CAPSImg/CAPSImg_5.1fs2.zip
  unzip -o -d $INSTALL/usr/config/fs-uae CAPSImg_5.1fs2.zip
  rm -rf $INSTALL/usr/config/fs-uae/Plugins/CAPSImg/OSX
  rm -rf $INSTALL/usr/config/fs-uae/Plugins/CAPSImg/SteamOS
  rm -rf $INSTALL/usr/config/fs-uae/Plugins/CAPSImg/Windows
  rm -rf $INSTALL/usr/config/fs-uae/Plugins/CAPSImg/Mac
  rm -rf $INSTALL/usr/config/fs-uae/Plugins/CAPSImg/Linux/x86

  # auto detection for DS4 bluetooth
  cd $INSTALL/usr/share/fs-uae
  cp input/sony_computer_entertainment_wireless_controller_14_10_1_0_linux.conf input/wireless_controller_14_6_1_0_linux.conf


  rm -rf $INSTALL/usr/share/applications
  rm -rf $INSTALL/usr/share/icons
  rm -rf $INSTALL/usr/share/mime
}
