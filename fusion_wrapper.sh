#!/bin/bash

set -e
set -x

BASE_DIR="$(realpath -m  $(dirname "$0"))"
. "$BASE_DIR/common.sh"

mkdir -p "$WINE_PREFIX" "$CACHE_DIR"
mkdir -p "$STEAM_COMPAT_CLIENT_INSTALL_PATH"

if [ ! -d "$DRIVE_C" ]; then
  exec ./fusion_setup.sh
fi

FUSION_EXE="$(find "$DRIVE_C/users" -name "Fusion360.exe")"
ID_MAN_EXE="$(find "$DRIVE_C/users" -name "AdskIdentityManager.exe")"
export WINEDEBUG="+err"

if [ "$1" == "winecfg" ]; then
  exec "$PROTON" run winecfg
  exit 0
fi

if [[ "$1" == "adskidmgr:"* ]]; then
  exec "$PROTON" run "$ID_MAN_EXE" "$@"
fi

exec "$PROTON" run "$FUSION_EXE"