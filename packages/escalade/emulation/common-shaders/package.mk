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

PKG_NAME="common-shaders"
PKG_VERSION="latest"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/libretro/common-shaders"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="emulation"
PKG_SHORTDESC="Collection of commonly used shaders"
PKG_AUTORECONF="no"

PKG_IS_ADDON="no"

unpack() {
  mkdir -p $ROOT/$PKG_BUILD
}

configure_target() {
  :
}

make_target() {
  rm -rf common retropie *.zip
  wget http://buildbot.libretro.com/assets/frontend/shaders_glsl.zip
  unzip -o -d common shaders_glsl.zip
  git clone --depth 1 https://github.com/RetroPie/common-shaders.git retropie
  find . -type f -exec chmod 644 {} \;
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/retroarch/shaders
  cp -R common/* $INSTALL/usr/share/retroarch/shaders
  cp -R retropie/retropie $INSTALL/usr/share/retroarch/shaders
}
