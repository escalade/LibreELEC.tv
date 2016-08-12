**A fork of LibreELEC with the following features:**
* LibreELEC 8.0 git
* Kodi 17 Krypton git
* Docker 1.11.1
* Emulationstation (Herdinger fork) + sselph scraper
* RetroArch git
* VICE 2.4.24
* UAE4ARM/FS-UAE git
* F2FS/BTRFS/XFS filesystem support
* RPi3 Bluetooth working out of the box
* UNFS3 NFS server

**Build command**
```
# PROJECT=Generic ARCH=x86_64 make image
or
# PROJECT=RPi2 ARCH=arm make image
```

**Reformat /storage to F2FS on next boot**
```
# touch /storage/.please_reformat_f2fs
```

**Automatically backup/restore while reformatting:**
```
# touch /storage/.backup
```

**Emulationstation arguments in /storage/.config/emulationstation/emulationstation.conf**
```
EMULATIONSTATION_OPTS="--ignore-gamelist --no-splash"
```

**Docker arguments in /storage/.config/docker/docker.conf**
```
DOCKER_DAEMON_OPTS="--graph=/storage/.docker"
DOCKER_STORAGE_OPTS="--storage-driver=overlay"
```

**Out of the box Emulationstation will look for roms in /storage/roms/(amiga|c64|mame|fba|gba|dreamcast|n64|psx|psp|saturn|snes|nes|nds). BIOS files should be put in /storage/roms/bios. Configured input controllers are DS4 (bluetooth) and keyboard. Configuration is in /storage/.config/emulationstation. The keyboard layout is as follows:**

```
Navigation = Arrow keys
A = Enter
B = Backspace
Page up = ,
Page down = .
Start = rctrl
Select = ralt
```

**Keyboard buttons in different apps**
```
Kodi shutdown menu = S
Kodi context menu = C
Emulationstation menu = RCTRL
uae4arm menu = F12
uae4arm joystick/mouse switch = F11
VICE menu = F12
Retroarch menu = F1
```

**Issues**

Visit the [escalade/libreelec.tv issue queue](https://github.com/escalade/LibreELEC.tv/pulls) for issues pertaining to this specific fork. For everything else, see the [LibreELEC Forum](https://forum.libreelec.tv).

Original README.md below.

# LibreELEC

LibreELEC is a 'Just enough OS' Linux distribution for running the award-winning [Kodi](http://kodi.tv) software on popular mediacentre hardware. LibreELEC is a conservative fork of the popular [OpenELEC](http://openelec.tv) project with a stronger focus on pre-release testing and post-release change management. Further information on the project can be found on the [LibreELEC website](https://libreelec.tv).

**Issues & Support**

Please report issues via the [LibreELEC forum: Bug Reports](http://forum.libreelec.tv/forum-35.html). Please ask support questions in the [LibreELEC forum: Help & Support](http://forum.libreelec.tv/forum-3.html) or ask a member of project staff in the #libreelec IRC channel on Freenode.

**Donations**

Contributions towards current project funding goals can be sent via PayPal to donations@libreelec.tv

**License**

LibreELEC original code is released under [GPLv2](http://www.gnu.org/licenses/gpl-2.0.html).

**Copyright**

As LibreELEC includes code from many upstream projects it includes many copyright owners. LibreELEC makes NO claim of copyright on any upstream code. However all original LibreELEC authored code is copyright LibreELEC.tv. For a complete copyright list please checkout the source code to examine license headers. Unless expressly stated otherwise all code submitted to the LibreELEC project (in any form) is licensed under [GPLv2](http://www.gnu.org/licenses/gpl-2.0.html) and copyright is donated to LibreELEC.tv. This approach allows the project to stay manageable in the long term by giving us freedom to maintain the code as part of the whole without the management overhead of preserving contact with every submitter, e.g. GPLv3. You are absolutely free to retain copyright. To retain copyright simply add a copyright header to each submitted code page. If you submit code that is not your own work it is your responsibility to place a header stating the copyright.
