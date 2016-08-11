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

PKG_NAME="oem"
PKG_VERSION=""
PKG_ARCH="any"
PKG_LICENSE="various"
PKG_SITE="http://www.libreelec.tv"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="virtual"
PKG_SHORTDESC="OEM: Metapackage for various OEM packages"
PKG_LONGDESC="OEM: Metapackage for various OEM packages"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

OEM_APPS_COMMON=" \
  addons-to-image \
  docker-system \
  NzbDrone \
  plexmediaserver-script \
  SABnzbd \
  tcpdump \
  transmission"

OEM_EMU_COMMON=" \
  dosbox-sdl \
  ds4drv \
  emulationstation \
  fba-libretro \
  fuse-libretro \
  genesis-plus-gx-libretro \
  emulationstation \
  mame2003-libretro \
  mgba-libretro \
  mupen64plus-libretro \
  quicknes-libretro \
  prboom-libretro \
  retroarch \
  scraper \
  scummvm-libretro \
  snes9x2010-libretro \
  yabause-libretro \
  vice"

OEM_EMU_GENERIC=" \
  beetle-psx-libretro \
  craft-libretro \
  desmume-libretro \
  fs-uae \
  ppsspp-libretro \
  qemu \
  reicast-libretro"

OEM_EMU_RPI=" \
  uae4arm \
  pcsx_rearmed-libretro"

if [ ! "$OEM_APPS" = "no" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OEM_APPS_COMMON"
fi

if [ ! "$OEM_EMU" = "no" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OEM_EMU_COMMON"
  case $PROJECT in
    Generic)
      PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OEM_EMU_GENERIC"
      ;;
    RPi*)
      PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OEM_EMU_RPI"
      ;;
  esac
fi
