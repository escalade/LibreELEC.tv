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

PKG_NAME="google-chrome"
PKG_VERSION="latest"
PKG_ARCH="any"
PKG_LICENSE="Freeware"
PKG_SITE="http://www.google.com/chrome"
PKG_URL="custom"
PKG_DEPENDS_TARGET="toolchain gtk+ libXcomposite libXcursor libxss nss gconf scrnsaverproto atk cups"
PKG_SECTION="apps"
PKG_SHORTDESC="Google Chrome browser"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

unpack() {
  mkdir -p $PKG_BUILD
}

make_target() {
  :
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  mkdir -p $INSTALL/usr/config
  mkdir -p $INSTALL/usr/share/applications
  mkdir -p $INSTALL/opt/google
  cp $PKG_DIR/files/google-chrome-stable $INSTALL/usr/bin/
  cp $PKG_DIR/files/chrome-flags.conf $INSTALL/usr/config/
  cp $PKG_DIR/files/mimeapps.list $INSTALL/usr/share/applications/
  ln -s /storage/.cache/app.chrome/google-chrome.desktop $INSTALL/usr/share/applications/
  ln -s /storage/.cache/app.chrome $INSTALL/opt/google/chrome
}
