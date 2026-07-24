# MonHun Nikki: Poka Poka Airu Mura G Translation Patch

#### An English translation patch for the PSP version of Monster Hunter Diary: Poka Poka Ailu Mura G.

![GitHub Last Commit](https://img.shields.io/github/last-commit/mykaadev/MonHun-Nikki-Poka-Poka-Airu-Mura-G-Translation-Patch)
![GitHub Issues](https://img.shields.io/github/issues/mykaadev/MonHun-Nikki-Poka-Poka-Airu-Mura-G-Translation-Patch)
![GitHub Stars](https://img.shields.io/github/stars/mykaadev/MonHun-Nikki-Poka-Poka-Airu-Mura-G-Translation-Patch)

Summary - Features - Requirements - Installation - Credits - Support

## Summary

This repository contains an xdelta patch for applying the English translation to a clean PSP ISO of `MonHun Nikki - Poka Poka Ailu Mura G (Japan, Asia)`.

The patch only contains changed data. No game ISO, copyrighted disc image, or original game files are included.

## Features

- English translated text based on the current PSP translation work.
- Simple folder layout for patching a clean ISO.
- Windows helper script included.
- SHA-256 validation before and after patching.
- xdelta-based patch, small enough to publish and share.

## Requirements

- A clean, unmodified ISO of `MonHun Nikki - Poka Poka Ailu Mura G (Japan, Asia)`.
- Windows, if using the included `ApplyPatch.bat`.
- PPSSPP or real PSP hardware to test the patched ISO.

Expected clean ISO SHA-256:

```text
3C6A83F437D74B836E9425C08B2AD2ACB18BEE1BB1B88819B7436A3F1B53F28F
```

## Installation

1. Open `MonHun-Nikki-Poka-Poka-Airu-Mura-G-Translation-Patch`.
2. Put your clean `.iso` inside `GameToPatch`.
3. Run `ApplyPatch.bat`.
4. The patched ISO will be created inside `Output`.

Expected patched ISO SHA-256:

```text
D6C23863D368F27FD83F6647B0E5BEE7339AFDEA868C1D1D9D14779D5505ADC6
```

## Folder Layout

```text
Patcher/
  tools/
  patch/
  GameToPatch/
  Output/
  ApplyPatch.bat
```

## Credits

Translation patch work by **mykaadev**.
Built with `xdelta3` from the official xdelta releases.
