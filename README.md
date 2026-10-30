# MonHun Nikki: Poka Poka Airu Mura G PSP Translation Patch

#### An English translation patch for the PSP version of Monster Hunter Diary: Poka Poka Ailu Mura G.

![GitHub Last Commit](https://img.shields.io/github/last-commit/mykaadev/MonHun-Nikki-Poka-Poka-Airu-Mura-G-PSP-Translation-Patch)
![GitHub Issues](https://img.shields.io/github/issues/mykaadev/MonHun-Nikki-Poka-Poka-Airu-Mura-G-PSP-Translation-Patch)
![GitHub Stars](https://img.shields.io/github/stars/mykaadev/MonHun-Nikki-Poka-Poka-Airu-Mura-G-PSP-Translation-Patch)

Summary - What's New - Download - Installation - FAQ - Reporting Bugs - Credits

## Summary

This repository contains an xdelta patch for applying the English translation to a clean PSP ISO of `MonHun Nikki - Poka Poka Ailu Mura G (Japan, Asia)`.

The patch only contains changed data. No game ISO, copyrighted disc image, or original game files are included, and none will be provided. You need your own copy of the game.

## What's New

**v0.2.1 (hotfix):** screen titles (STATUS, PAMPHLET, ...) no longer have their letters squashed together.

**v0.2:**

- **Much more of the game is in English.** Many conversations are stored twice in the game data, and the previous patch only updated one copy, so lots of dialogue (often "filler" chatter) stayed Japanese. Both copies are translated now.
- **Fixed the Informant's "Want me to explain?" prompts** (pier, field, mining site, bug-catching area, ranch). The Yes/No choices showed the Informant's own lines instead of real choices ([#1](https://github.com/mykaadev/MonHun-Nikki-Poka-Poka-Airu-Mura-G-PSP-Translation-Patch/issues/1)).
- **New English font spacing.** The game's font spaced English letters like Japanese characters, so words had huge gaps and text ran out of its boxes. Letters now have proper widths, and screen titles are slightly condensed to fit.
- **Re-worded about 1,700 lines** so they fit their boxes: menu labels, screen titles, help bars, item descriptions, villager profiles, fortunes, culture shocks and quest text. Fixed some mistranslations along the way.
- **Line breaks re-done** for dialogue, descriptions and help text to match the new font.
- **Fixed numbers with stray words after them** ("0PCS", "1RANK", "5AY", "NUMBER").

Known issues: some dialogue still reads stiffly or out of context, weapon/armor names are still long, a few hundred lines outside the main text files are still Japanese, and some names (e.g. the Bullfango boss) aren't consistent yet.

## Download

- **Easiest:** open the [Releases](https://github.com/mykaadev/MonHun-Nikki-Poka-Poka-Airu-Mura-G-PSP-Translation-Patch/releases) page and download the latest `.zip`.
- **Or:** on the main repository page click the green **Code** button, then **Download ZIP**.

Unzip it anywhere. Everything you need is in the `Patcher` folder.

## Requirements

- A clean, unmodified ISO of `MonHun Nikki - Poka Poka Ailu Mura G (Japan, Asia)` (product code `ULJM05881`).
- PPSSPP (PC or Android) or a PSP that can run ISOs.

Expected clean ISO SHA-256:

```text
3C6A83F437D74B836E9425C08B2AD2ACB18BEE1BB1B88819B7436A3F1B53F28F
```

If your ISO has a different hash, the patch will refuse to apply. That usually means a different version or a modified/trimmed dump.

## Installation

### Windows

1. Open the `Patcher` folder.
2. Put your clean `.iso` inside `GameToPatch` (only one ISO in there).
3. Run `ApplyPatch.bat`.
4. The patched ISO is created inside `Output`.

### Android, Mac, Linux

The patch is a standard xdelta file: `Patcher/patch/PokaPoka_Ailu_Mura_G_EN_test.xdelta`. Any xdelta-compatible patcher works, for example:

- **Android:** a patcher app that supports xdelta (such as UniPatcher). Select your clean ISO as the source and the `.xdelta` file as the patch, then load the output ISO in PPSSPP. Patching a ~640 MB ISO needs some free storage and can take a minute.
- **Mac / Linux:** install `xdelta3` (e.g. `brew install xdelta` or your distro's `xdelta3` package) and run:

```text
xdelta3 -d -s "your clean.iso" PokaPoka_Ailu_Mura_G_EN_test.xdelta PokaPoka_EN.iso
```

You can also patch on a PC and copy the finished ISO to your phone.

Expected patched ISO SHA-256:

```text
4691306218E1B79C178BEE2123CBF1A1D2DB025D2FA7FBECD63E7DE1E8B46E1D
```

## FAQ

**Does it work with the first game (Poka Poka Airu Mura, without the "G")?**
No. The patch only works with the G version (`ULJM05881`) with the hash above.

**I updated the patch but still see old/Japanese text.**
Don't load a save state from before the update: save states restore the old text from memory. Boot the game normally and load your in-game save. Your save data itself works fine.

**Can I help test?**
Yes, please! Just play and report anything odd (see below). Screenshots of untranslated or overflowing text help the most.

**Where can I download the game?**
Not here. Please don't ask or post links to ISOs in the issues.

## Reporting Bugs

Open an [issue](https://github.com/mykaadev/MonHun-Nikki-Poka-Poka-Airu-Mura-G-PSP-Translation-Patch/issues/new/choose) and include:

- a screenshot,
- where it happened (screen, character, what you were doing),
- the patch version you used,
- your emulator/device, and whether you loaded a save state.

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

Most of the English text is based on the fan translation of the 3DS version, *Monster Hunter Diary: Poka Poka Airou Village DX*, by [L-StarJP](https://github.com/L-StarJP/Monster-Hunter-Diary-Poka-Poka-Airou-Village-DX-English-translation-3DS) and contributors. Thank you!

Thanks to the PPSSPP project, and to everyone who reported bugs.

Built with `xdelta3` from the official xdelta releases.

## Disclaimer

This is an unofficial fan project, not affiliated with or endorsed by Capcom or FromSoftware. Monster Hunter and all related names are trademarks of Capcom. No game files are distributed here.
