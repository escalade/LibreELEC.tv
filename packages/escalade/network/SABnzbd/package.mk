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

PKG_NAME="SABnzbd"
PKG_VERSION="1.2.0"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="http://sabnzbd.org/"
PKG_URL="https://github.com/sabnzbd/sabnzbd/releases/download/$PKG_VERSION/$PKG_NAME-$PKG_VERSION-src.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python Cheetah yenc six par2cmdline unrar cryptography p7zip"
PKG_SECTION="service/downloadmanager"
PKG_SHORTDESC="SABnzbd makes Usenet as simple and streamlined as possible by automating everything we can."
PKG_LONGDESC="SABnzbd makes Usenet as simple and streamlined as possible by automating everything we can. All you have to do is add a .nzb file. SABnzbd+ takes over from there, where it will be automatically downloaded, verified, repaired, extracted and filed away with zero human interaction."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  : # nothing to do here
}

makeinstall_target() {
  mkdir -p $INSTALL/opt/sabnzbd
  cp -PR * $INSTALL/opt/sabnzbd/
  mkdir -p $INSTALL/usr/bin
  cp $(get_build_dir p7zip)/bin/7za $INSTALL/usr/bin/
}

post_makeinstall_target() {
  mkdir -p $INSTALL/usr/config/sabnzbd
  cp $PKG_DIR/config/* $INSTALL/usr/config/sabnzbd
}
