#!/bin/bash

set -e

flatpak-builder --user --install --force-clean build-dir com.autodesk.Fusion360.yml
echo "======="
flatpak run com.autodesk.Fusion360 "$@"