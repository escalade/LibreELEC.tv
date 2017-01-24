################################################################################
#
# Extended build by Escalade (https://github.com/escalade/LibreELEC.tv)
#
################################################################################

PKG_NAME="amiberry-sdl2"
PKG_VERSION="b66e10b"
PKG_ARCH="arm"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/midwan/amiberry"
PKG_URL="https://github.com/midwan/amiberry/archive/sdl2/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="amiberry-sdl2"
PKG_DEPENDS_TARGET="toolchain alsa-lib freetype zlib SDL2 SDL2_image libpng flac mpg123"
PKG_SECTION="emulation"
PKG_SHORTDESC="Amiga emulator optimized for Raspberry Pi"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  case $PROJECT in
    RPi)
      make PLATFORM=rpi1 CXX=$CXX STRIP=$STRIP SYSROOT_PREFIX=$SYSROOT_PREFIX
      ;;
    RPi2)
      make PLATFORM=rpi2 CXX=$CXX STRIP=$STRIP SYSROOT_PREFIX=$SYSROOT_PREFIX
      ;;
  esac
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp amiberry-sdl2 $INSTALL/usr/bin
  cp $PKG_DIR/scripts/* $INSTALL/usr/bin
  mkdir -p $INSTALL/usr/config
  cp -R $PKG_DIR/config $INSTALL/usr/config/amiberry
  cp -R data $INSTALL/usr/config/amiberry/
  ln -s /storage/roms/bios $INSTALL/usr/config/amiberry/kickstarts
 }
