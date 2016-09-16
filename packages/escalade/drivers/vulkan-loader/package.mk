################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="vulkan-loader"
PKG_VERSION="428991a"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="Apache 2.0"
PKG_SITE="https://www.khronos.org"
PKG_URL="https://github.com/KhronosGroup/Vulkan-LoaderAndValidationLayers/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain cmake:host"
PKG_PRIORITY="optional"
PKG_SECTION="depends"
PKG_SHORTDESC="Vulkan Installable Client Driver (ICD) Loader."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

post_unpack() {
  mv $BUILD/Vulkan-Loader* $BUILD/$PKG_NAME-$PKG_VERSION
}

pre_configure_target() {
  cd ..
  ./update_external_sources.sh
  cd -
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc \
        -DCMAKE_INSTALL_DATADIR=/share \
        -DCMAKE_SKIP_RPATH=true \
        -DBUILD_WSI_XLIB_SUPPORT=On \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTS=Off \
        -DBUILD_LAYERS=Off \
        -DBUILD_DEMOS=Off \
        -DBUILD_VKJSON=Off \
        $EXTRA_CMAKE_OPTS \
        ..
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib
  cp -rv loader/libvulkan.so* $INSTALL/usr/lib/
  cp -rv loader/libvulkan.so* $SYSROOT_PREFIX/usr/lib/
}
