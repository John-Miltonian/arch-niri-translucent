# Agent Memory

## Project Overview

A complete Arch Linux rice featuring:
- **Niri** window manager (scrollable-tiling Wayland compositor)
- **Dark mode** theme with deep blacks and gold/crimson accents
- **Transparent windows** via kitty terminal opacity
- **Christian aesthetic** with cross iconography and biblical verses

## Key Components

### Window Manager: Niri
- **Config**: `config/niri/config.kdl`
- **Features**: Scrollable tiling, column-based layout, overview mode
- **Transparency**: Via `prefer-no-csd` and terminal/app-level opacity
- **Borders**: Gradient from crimson to royal purple

### Terminal: Kitty
- **Config**: `config/kitty/kitty.conf`
- **Opacity**: 85% background transparency
- **Colors**: Cassock black (#0a0a0a), parchment (#d4c4a8), gold (#b8860b)

### Status Bar: Waybar
- **Config**: `config/waybar/config.jsonc`
- **CSS**: `config/waybar/style.css`
- **Center Module**: Daily Bible verse generator
- **Transparency**: 75% background opacity

### Bible Verse Generator
- **Script**: `config/waybar/modules/bible-verse.sh`
- **Features**: Rotates verses every 30 minutes via signal
- **Verse Count**: 40+ curated scriptures
- **Output**: JSON for Waybar consumption

### Application Launcher: Fuzzel
- **Config**: `config/fuzzel/fuzzel.ini`
- **Prompt**: ✝ symbol
- **Theme**: Dark with cardinal red border

### Notification Daemon: Mako
- **Config**: `config/mako/config`
- **Position**: Top-right
- **Style**: Dark translucent with urgency-based colors

### Lock Screen: Swaylock
- **Config**: `config/swaylock/config`
- **Colors**: Cardinal red ring, dark center
- **Blur**: Available via command-line flags

## Color Palette

| Color | Hex | Usage |
|-------|-----|-------|
| Background | #0a0a0a | Main background |
| Foreground | #d4c4a8 | Text, icons |
| Gold | #b8860b | Accents, active elements |
| Crimson | #8b0000 | Borders, warnings |
| Purple | #4a1942 | Selection, secondary |
| Green | #4a7c59 | Success indicators |

## File Structure

```
arch-niri-translucent/
├── config/
│   ├── niri/config.kdl         # Window manager
│   ├── kitty/kitty.conf          # Terminal
│   ├── waybar/
│   │   ├── config.jsonc        # Status bar
│   │   ├── style.css           # Status bar theme
│   │   └── modules/            # Waybar scripts
│   │       ├── bible-verse.sh
│   │       ├── niri-workspaces.sh
│   │       └── niri-window.sh
│   ├── fuzzel/fuzzel.ini       # Launcher
│   ├── mako/config             # Notifications
│   ├── swaylock/config         # Lock screen
│   └── fastfetch/config.jsonc  # System info
├── scripts/
│   ├── bible-verse.sh          # Standalone verse generator
│   └── bible-continuous.sh     # Background verse rotator
├── wallpapers/                 # User wallpapers
├── install.sh                  # Installation script
├── README.md                   # Documentation
└── QUICKSTART.md               # Quick reference
```

## Maintenance Notes

- Update verse list by editing `bible-verse.sh` arrays
- Transparency is app-level (Niri doesn't do compositor blur)
- Waybar modules need `jq` installed
- Bible verse updates via signal: `pkill -SIGRTMIN+10 waybar`

## User Context

Josh (joshr) uses this for:
- Writing theological horror fiction (House of Leaves style)
- Bible study and research
- Christian-themed computing environment

## Key Features to Preserve

1. Daily Bible verse in Waybar center
2. Dark theme with gold/crimson accents
3. Cross (✝) iconography throughout
4. Terminal transparency
5. Christian color symbolism (not just aesthetic choice)
