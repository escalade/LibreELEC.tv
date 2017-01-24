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

PKG_NAME="unfs3"
PKG_VERSION="497"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/markusn/unfs3"
PKG_URL="custom"
PKG_DEPENDS_TARGET="toolchain flex"
PKG_SECTION="network"
PKG_SHORTDESC="UNFS3 server"

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

MAKEFLAGS="-j1"

unpack() {
  svn checkout -r $PKG_VERSION svn://svn.code.sf.net/p/unfs3/code/trunk $PKG_BUILD
}

post_install() {
  cp $PKG_DIR/config/exports $INSTALL/usr/config
  enable_service unfsd.service
}
