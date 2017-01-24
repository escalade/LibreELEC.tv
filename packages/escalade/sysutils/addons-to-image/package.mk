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
PKG_NAME="addons-to-image"
PKG_VERSION="1.0"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="system"
PKG_SHORTDESC="create addons and copy them to image"
PKG_LONGDESC="create addons and copy them to image"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_ADDONS_INCLUDE=""

make_target() {
  for ADDON_ID in $PKG_ADDONS_INCLUDE; do
  (
    cd $ROOT
    $SCRIPTS/create_addon $ADDON_ID
  )
  done
}

makeinstall_target() {
  for ADDON_ID in $PKG_ADDONS_INCLUDE; do
    mkdir -p $INSTALL/usr/share/kodi/addons/$ADDON_ID
    cp -PR $ROOT/$BUILD/addons/$ADDON_ID/*$ADDON_ID $INSTALL/usr/share/kodi/addons
    KODI_ADDON_MANIFEST="$ROOT/$BUILD/image/system/usr/share/kodi/system/addon-manifest.xml"
    xmlstarlet ed -L --subnode "/addons" -t elem -n "addon" -v "$ADDON_ID" $KODI_ADDON_MANIFEST
  done
}
