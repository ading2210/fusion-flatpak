#!/bin/bash

set -e
set -x

BASE_DIR="$(realpath -m  $(dirname "$0"))"
. "$BASE_DIR/common.sh"

FUSION_DOWNLOAD_URL="https://dl.appstreaming.autodesk.com/production/installers/Fusion%20Client%20Downloader.exe"
WEBVIEW2_DOWNLOAD_URL="https://go.microsoft.com/fwlink/?linkid=2124701"

FUSION_INSTALLER="$CACHE_DIR/fusion_installer.exe"
WEBVIEW2_INSTALLER="$CACHE_DIR/webview2_installer.exe"
if [ ! -f "$FUSION_INSTALLER" ]; then
  wget "$FUSION_DOWNLOAD_URL" -O "$FUSION_INSTALLER"
fi
if [ ! -f "$WEBVIEW2_INSTALLER" ]; then
  wget "$WEBVIEW2_DOWNLOAD_URL" -O "$WEBVIEW2_INSTALLER"
fi

"$PROTON" run wineboot -u
"$PROTON" run reg add 'HKCU\Software\Wine\Drivers' /v Audio /d pulse /f
"$PROTON" run reg add 'HKCU\Software\Wine' /v Version /d win11 /f

if [ ! "$(find "$DRIVE_C" -iname 'msedgewebview2.exe')" ]; then
  "$PROTON" run "$WEBVIEW2_INSTALLER" /silent /install
fi

SKIP_PRECHECK=1 "$PROTON" run "$FUSION_INSTALLER"