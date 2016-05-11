################################################################################
#      This file is part of LibreELEC - http://www.libreelec.tv
#      Copyright (C) 2009-2016 Lukas Rusak (lrusak@libreelec.tv)
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

PKG_NAME="scraper"
PKG_VERSION="1.1.0"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/sselph/scraper"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="emulation"
PKG_SHORTDESC="Docker is an open-source engine that automates the deployment of any application as a lightweight, portable, self-sufficient container that will run virtually anywhere."
PKG_LONGDESC="Docker containers can encapsulate any payload, and will run consistently on and between virtually any server. The same container that a developer builds and tests on a laptop will run at scale, in production*, on VMs, bare-metal servers, OpenStack clusters, public instances, or combinations of the above."
PKG_AUTORECONF="no"

PKG_IS_ADDON="no"

unpack() {
  mkdir -p $ROOT/$PKG_BUILD
}

configure_target() {
  :
}

make_target() {
  if [ "$PROJECT" = "RPi" ]; then
    wget $PKG_SITE/releases/download/v$PKG_VERSION/scraper_rpi.zip
  elif [ "$PROJECT" = "RPi2" ]; then
    wget $PKG_SITE/releases/download/v$PKG_VERSION/scraper_rpi2.zip
  elif [ "$PROJECT" = "Generic" ]; then
    wget $PKG_SITE/releases/download/v$PKG_VERSION/scraper_linux_amd64.zip
  fi
  unzip -o *.zip
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp scraper $INSTALL/usr/bin
}
