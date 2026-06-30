#!/usr/bin/env bash
D=$(cd "$(dirname "$0")" && pwd); S=""; [ "$(id -u)" -ne 0 ] && S=sudo
for f in droidB-gui droidB-samsung droidB-mod droidB; do [ -f "$D/$f" ] && $S install -Dm755 "$D/$f" /usr/local/bin/$f; done
$S install -Dm644 /dev/stdin /usr/share/applications/droidB.desktop <<DESK
[Desktop Entry]
Type=Application
Name=droidB
GenericName=Android Toolkit
Comment=ARXOS Android toolkit (ADB, fastboot, flashing, root/ROM)
Exec=droidB-gui
Icon=phone
Terminal=false
Categories=System;Utility;
DESK
$S pacman -S --noconfirm --needed android-tools >/dev/null 2>&1 || true
echo "droidB installed"
