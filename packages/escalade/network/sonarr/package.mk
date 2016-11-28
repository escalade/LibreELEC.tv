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

PKG_NAME="sonarr"
PKG_VERSION="2.0.0.4409"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://sonarr.tv"
PKG_URL="http://update.sonarr.tv/v2/master/mono/NzbDrone.master.$PKG_VERSION.mono.tar.gz"
PKG_SOURCE_DIR="NzbDrone"
PKG_DEPENDS_TARGET="toolchain mono-system libmediainfo"
PKG_SECTION="service/downloadmanager"
PKG_SHORTDESC="Smart PVR for newsgroup and bittorrent users."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  : # nothing to do here
}

makeinstall_target() {
  mkdir -p $INSTALL/opt/sonarr
  cp -PR * $INSTALL/opt/sonarr/
}
