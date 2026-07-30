# Autodesk Fusion Flatpak

A standalone Flatpak package for running Autodesk Fusion on Linux using GE-Proton.

## Dependencies

Make sure `flatpak` and `flatpak-builder` are installed on your system. You will also need the Flathub remote enabled.

## Build and Install

Clone this repo and cd into it:
```bash
git clone https://github.com/ading2210/fusion-flatpak
cd fusion-flatpak
```

Install dependencies:
```bash
flatpak install --user org.freedesktop.Platform.Compat.i386//25.08 -y
flatpak install --user com.valvesoftware.Steam.CompatibilityTool.Proton-GE -y
```

Install and build the package:
```bash
flatpak-builder --user --install --force-clean --install-deps-from=flathub build-dir com.autodesk.Fusion360.yml
```

## Usage

Simply run the Flatpak in your terminal. It will download and install Fusion on the first run.

```bash
flatpak run com.autodesk.Fusion360
```

You can use the `cmd` argument to run a specific exe inside the Wine prefix (such as winecfg):

```bash
flatpak run com.autodesk.Fusion360 cmd winecfg
```

You can use the `desktop` argument to launch Fusion in a virtual desktop of a specific resolution. This may be useful to fix some windowing bugs.

```bash
flatpak run com.autodesk.Fusion360 desktop 1920x1080
````