################################################################################
#
# Extended build by Escalade (https://github.com/escalade/LibreELEC.tv)
#
################################################################################

PKG_NAME="mrboom-libretro"
PKG_VERSION="e68c2d3"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/mrboom-libretro"
PKG_URL="https://github.com/libretro/mrboom-libretro/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="emulation"
PKG_SHORTDESC="Mr.Boom is a 8 players Bomberman clone for RetroArch/Libretro."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_build_target() {
  export GIT_VERSION=$PKG_VERSION
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp *.so $INSTALL/usr/lib/libretro/
}
