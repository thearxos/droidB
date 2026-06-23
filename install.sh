#!/usr/bin/env bash
set -e; D="$(cd "$(dirname "$0")" && pwd)"; S=""; [ "$(id -u)" -ne 0 ] && S=sudo
$S install -Dm755 "$D/droidB"      /usr/local/bin/droidB
$S install -Dm755 "$D/droidB-gui"  /usr/local/bin/droidB-gui
$S install -Dm644 "$D/recovery.png" /usr/share/droidB/recovery.png
$S install -Dm644 "$D/droidB.png"   /usr/share/droidB/droidB.png
$S install -Dm644 "$D/droidB.png"   /usr/share/icons/hicolor/256x256/apps/droidB.png 2>/dev/null || true
$S install -Dm644 "$D/droidB.desktop" /usr/share/applications/droidB.desktop
python3 -c 'import gi' 2>/dev/null || $S pacman -S --noconfirm --needed python-gobject gtk3 >/dev/null 2>&1 || true
command -v adb >/dev/null 2>&1 || $S pacman -S --noconfirm --needed android-tools >/dev/null 2>&1 || true
gtk-update-icon-cache /usr/share/icons/hicolor 2>/dev/null || true
echo "droidB (TUI) + droidB-gui (GUI) installed"
