# Autodesk Fusion Flatpak

A standalone Flatpak package for running Autodesk Fusion on Linux using GE-Proton.

## Dependencies

Make sure `flatpak` and `flatpak-builder` are installed on your system. You will also need the Flathub remote enabled:

```bash
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

## Build & Install

```bash
flatpak-builder --user --install --force-clean --install-deps-from=flathub build-dir com.autodesk.Fusion360.yml
```

## Run

```bash
flatpak run com.autodesk.Fusion360
```