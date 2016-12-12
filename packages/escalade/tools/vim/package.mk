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

PKG_NAME="vim"
PKG_VERSION="8.0.0022"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="VIM"
PKG_SITE="http://www.vim.org/"
PKG_URL="https://github.com/vim/vim/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain netbsd-curses"
PKG_SECTION="tools"
PKG_SHORTDESC="vim: VI IMproved"
PKG_LONGDESC="Vim is a highly configurable text editor built to enable efficient text editing. It is an improved version of the vi editor distributed with most UNIX systems."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="vim_cv_toupper_broken=no \
                           vim_cv_terminfo=yes \
                           vim_cv_tty_group=world \
                           vim_cv_tty_mode=0620 \
                           vim_cv_getcwd_broken=no \
                           vim_cv_stat_ignores_slash=yes \
                           vim_cv_memmove_handles_overlap=yes \
                           ac_cv_sizeof_int=4 \
                           ac_cv_small_wchar_t=no \
			   --enable-selinux=no \
                           --enable-gui=no \
                           --with-compiledby=LibreELEC \
                           --with-features=huge \
                           --with-tlib=ncurses \
                           --without-x"

pre_configure_target() {
  cd ..
  rm -rf .$TARGET_NAME
  export LIBS="-lcurses -lterminfo"
}

post_makeinstall_target() {
  mkdir $INSTALL/bin
  ln -sf /usr/bin/vim $INSTALL/usr/bin/vi
  rm -rf $INSTALL/usr/share/vim*/doc
  rm -rf $INSTALL/usr/share/vim*/lang
  rm -rf $INSTALL/usr/share/vim*/spell
  rm -rf $INSTALL/usr/share/vim*/tutor
}
