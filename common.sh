#!/bin/bash

set -e
set -x

BASE_DIR="$(realpath -m  $(dirname "$0"))"

PROTON="/app/proton/proton"
WINE_PREFIX="$XDG_DATA_HOME/fusion_360"
DRIVE_C="$WINE_PREFIX/pfx/drive_c"
CACHE_DIR="$XDG_CACHE_HOME/fusion_360"

export STEAM_COMPAT_DATA_PATH="$WINE_PREFIX"
export STEAM_COMPAT_CLIENT_INSTALL_PATH="$WINE_PREFIX/steam_stub"

export NO_AT_BRIDGE=1
export PROTON_USE_WINED3D=0
export DXVK_ASYNC=1
export PROTON_USE_XALIA=0
export WINEDLLOVERRIDES="winealsa.drv=d;winewayland.drv=d;webview2=disabled;bcp47langs="

export UMU_ID="fusion360"
export STEAM_COMPAT_DATA_PATH="$WINE_PREFIX"
export STEAM_COMPAT_APP_ID=0
