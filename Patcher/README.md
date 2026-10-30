# 🐱 Poka Poka Airu Mura G - English Patch

You need your own ISO of **MonHun Nikki - Poka Poka Ailu Mura G (Japan, Asia)** (ULJM05881).

## 🪟 Windows

1. Put your ISO in `GameToPatch/` (just one ISO in there).
2. Double-click `ApplyPatch.bat`.
3. Your English ISO appears in `Output/`.

## 🤖 Android

Use a patcher app that supports **xdelta** (for example UniPatcher):
- source / ROM: your ISO
- patch: `patch/PokaPoka_Ailu_Mura_G_EN_test.xdelta`

Then open the new ISO in PPSSPP.

## 🍎 Mac / 🐧 Linux

Install `xdelta3` (`brew install xdelta` or `sudo apt install xdelta3`), then from this folder:

```bash
xdelta3 -d -s "/path/to/your game.iso" patch/PokaPoka_Ailu_Mura_G_EN_test.xdelta PokaPoka_EN.iso
```

## 💡 Good to know

- Don't load **save states** from an older version (they bring back old text). Load your normal in-game save instead.
- If the patcher says your ISO doesn't match, it's a different or modified copy (e.g. trimmed or `.cso`).
- Bugs, questions, updates: https://github.com/mykaadev/MonHun-Nikki-Poka-Poka-Airu-Mura-G-PSP-Translation-Patch

## 🔒 Checksums (SHA-256)

Original ISO:

`3C6A83F437D74B836E9425C08B2AD2ACB18BEE1BB1B88819B7436A3F1B53F28F`

English ISO:

`4691306218E1B79C178BEE2123CBF1A1D2DB025D2FA7FBECD63E7DE1E8B46E1D`
