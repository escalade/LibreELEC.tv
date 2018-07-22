################################################################################
#      This file is part of LibreELEC - http://www.libreelec.tv
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

PKG_NAME="vlc"
PKG_VERSION="3.0.3"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.videolan.org"
PKG_URL="http://get.videolan.org/vlc/$PKG_VERSION/vlc-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain dbus gnutls ffmpeg libmpeg2 zlib flac libvorbis" #lua 
PKG_SECTION="xmedia/tools"
PKG_SHORTDESC="VideoLAN multimedia player and streamer"
PKG_LONGDESC="VLC is the VideoLAN project's media player. It plays MPEG, MPEG2, MPEG4, DivX, MOV, WMV, QuickTime, mp3, Ogg/Vorbis files, DVDs, VCDs, and multimedia streams from various network sources."
PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

 if [ "$TARGET_ARCH" == "arm" ]; then
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET lua" 

fi 

PKG_CONFIGURE_OPTS_TARGET="--enable-silent-rules \
            --disable-dependency-tracking \
	    --disable-nls \
            --disable-rpath \
            --disable-sout \
            --disable-lua \
            --disable-vlm \
            --disable-taglib \
            --disable-live555 \
            --disable-dc1394 \
            --disable-dvdread \
            --disable-dvdnav \
            --disable-opencv \
            --disable-decklink \
            --disable-sftp \
            --disable-v4l2 \
            --disable-gnomevfs \
            --disable-vcdx \
            --disable-vcd \
            --disable-libcddb \
            --disable-dvbpsi \
            --disable-screen \
            --enable-ogg \
            --enable-mux_ogg \
            --disable-shout\
            --disable-mkv \
            --disable-mod \
            --enable-mpc \
            --disable-gme \
            --disable-wma-fixed \
            --disable-shine \
            --disable-omxil \
            --disable-mad \
            --disable-merge-ffmpeg \
            --enable-avcodec \
            --enable-avformat \
            --enable-swscale \
            --enable-postproc \
            --disable-faad \
            --enable-flac \
            --enable-aa \
            --disable-twolame \
            --disable-quicktime \
            --disable-realrtsp \
            --disable-libtar \
            --disable-a52 \
            --disable-dca \
            --enable-libmpeg2 \
            --enable-vorbis \
            --disable-tremor \
            --disable-speex \
            --disable-theora \
            --disable-schroedinger \
            --disable-png \
            --disable-x264 \
            --disable-fluidsynth \
            --disable-zvbi \
            --disable-telx \
            --disable-libass \
            --disable-kate \
            --disable-tiger \
            --disable-libva \
            --disable-vdpau \
            --without-x \
            --disable-xcb \
            --disable-xvideo \
            --disable-sdl \
            --disable-sdl-image \
            --disable-freetype \
            --disable-fribidi \
            --disable-fontconfig \
            --enable-libxml2 \
            --disable-svg \
            --disable-directx \
            --disable-directfb \
            --disable-caca \
            --disable-oss \
            --disable-pulse \
            --enable-alsa \
            --disable-jack \
            --disable-upnp \
            --disable-skins2 \
            --disable-kai \
            --disable-macosx \
            --disable-macosx-dialog-provider \
            --disable-macosx-eyetv \
            --disable-macosx-vlc-app \
            --disable-macosx-qtkit \
            --disable-macosx-quartztext \
            --disable-ncurses \
            --disable-goom \
            --disable-projectm \
            --disable-atmo \
            --disable-bonjour \
            --enable-udev \
            --disable-mtp \
            --disable-lirc \
            --disable-libgcrypt \
            --enable-gnutls \
            --disable-update-check \
            --disable-kva \
            --disable-bluray \
            --disable-samplerate \
            --disable-sid \
            --disable-crystalhd \
            --disable-dxva2 \
            --disable-vlc \
            LUAC=$ROOT/$TOOLCHAIN/bin/luac"

pre_configure_target() {
  export LDFLAGS="$LDFLAGS -lresolv"
 
if [ "$TARGET_ARCH" == "arm" ]; then
  export LUA_LIBS="-L$SYSROOT_PREFIX/usr/lib -llua -lm"
fi

}

post_makeinstall_target() {
  rm -fr $INSTALL/usr/share/applications
  rm -fr $INSTALL/usr/share/icons
  rm -fr $INSTALL/usr/share/kde4
  rm -f $INSTALL/usr/bin/rvlc
  rm -f $INSTALL/usr/bin/vlc-wrapper

  mkdir -p $INSTALL/usr/config
    mv -f $INSTALL/usr/lib/vlc $INSTALL/usr/config
    ln -sf /storage/.config/vlc $INSTALL/usr/lib/vlc
}
