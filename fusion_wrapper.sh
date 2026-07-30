#!/bin/bash

set -e
set -x

BASE_DIR="$(realpath -m  $(dirname "$0"))"
. "$BASE_DIR/common.sh"

mkdir -p "$WINE_PREFIX" "$CACHE_DIR"
mkdir -p "$STEAM_COMPAT_CLIENT_INSTALL_PATH"

FUSION_EXE="$(find "$DRIVE_C/users" -name "Fusion360.exe" || true)"
ID_MAN_EXE="$(find "$DRIVE_C/users" -name "AdskIdentityManager.exe" || true)"

if [ "$1" == "cmd" ]; then
  shift
  exec "$PROTON" run "$@"
fi

if [ ! -f "$FUSION_EXE" ]; then
  exec ./fusion_setup.sh
fi

if [ "$1" == "desktop" ] && [ "$2" ]; then
  RESOLUTION="$2"
  shift; shift
  "$PROTON" run reg add 'HKCU\Software\Wine\Explorer' /v Desktop /d Fusion /f
  "$PROTON" run reg add 'HKCU\Software\Wine\Explorer\Desktops' /v Fusion /d "$RESOLUTION" /f
  "$PROTON" run "$FUSION_EXE" || true
  "$PROTON" run reg delete 'HKCU\Software\Wine\Explorer' /v Desktop /f 
  "$PROTON" run reg delete 'HKCU\Software\Wine\Explorer\Desktops' /v Fusion /f
  exit 0
fi

if [[ "$1" == "adskidmgr:"* ]]; then
  exec "$PROTON" run "$ID_MAN_EXE" "$@"
fi


exec "$PROTON" run "$FUSION_EXE"