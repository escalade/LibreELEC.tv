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

PKG_NAME="buildbot-cores"
PKG_VERSION="latest"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="http://buildbot.libretro.com"
PKG_DEPENDS_TARGET="toolchain retroarch"
PKG_SECTION="emulation"
PKG_SHORTDESC="libretro cores from buildbot.libretro.com"
PKG_AUTORECONF="no"

PKG_IS_ADDON="no"

configure_target() {
  :
}

make_target() {
  rm -f *.zip *.so
  if [[ "$PROJECT" =~ "RPi" ]]; then
    wget -e robots=off -r -nH --cut-dirs=4 --no-parent --reject="index.html*" http://buildbot.libretro.com/nightly/linux/armhf/latest/
  elif [ "$PROJECT" = "Generic" ]; then
    wget -e robots=off -r -nH --cut-dirs=4 --no-parent --reject="index.html*" http://buildbot.libretro.com/nightly/linux/x86_64/latest/
    rm -f mame201* mame2000* mame_* ume20* mess* fb_* bsnes_[a-c,p]* puae* snes9x_lib* stella* dinothawr* virtual_jaguar*
  fi
  for a in *.zip; do unzip $a; done
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp *.so $INSTALL/usr/lib/libretro
}
