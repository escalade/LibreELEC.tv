# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019 Trond Haugland (trondah@gmail.com)

PKG_NAME="munt"
PKG_VERSION="1ea0469"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/munt/munt"
PKG_URL="https://github.com/munt/munt/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain cmake:host"
PKG_SECTION="escalade"
PKG_SHORTDESC="Software synthesizer capable of emulating Roland MT-32"

PKG_CMAKE_OPTS_TARGET="-Dmunt_WITH_MT32EMU_QT=0 \
		       -Dmunt_WITH_MT32EMU_SMF2WAV=0 \
		       -Dlibmt32emu_SHARED=1"
