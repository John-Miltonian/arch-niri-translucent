# Arch Niri
## Dark Mode + Transparent Windows + Christian Aesthetic

> *"For with thee is the fountain of life: in thy light shall we see light."* — Psalm 36:9

A complete Arch Linux rice featuring the **Niri** scrollable-tiling Wayland compositor with dark mode, transparent windows, and a Christian aesthetic.

![Niri Window Manager](https://img.shields.io/badge/WM-Niri-8b0000?style=flat-square)
![Dark Mode](https://img.shields.io/badge/Theme-Dark%20Mode-1a1512?style=flat-square)
![Transparent](https://img.shields.io/badge/Windows-Transparent-b8860b?style=flat-square)

---

## ✝ Features

- **🪟 Niri Window Manager** - Scrollable-tiling Wayland compositor with smooth animations
- **🌙 Dark Mode Theme** - Deep cassock black (#0a0a0a) with gold and crimson accents
- **🔮 Transparent Windows** - 85% opacity terminal, translucent notifications
- **📖 Daily Bible Verse** - Scripture displayed in the status bar center
- **✝ Christian Aesthetic** - Cross iconography, biblical colors, reverent design
- **⚡ Performance Focused** - Lightweight, no compositor overhead

---

## 🎨 Color Scheme

| Element | Hex | Description |
|---------|-----|-------------|
| Background | `#0a0a0a` | Cassock black |
| Foreground | `#d4c4a8` | Aged parchment |
| Accent | `#b8860b` | Byzantine gold |
| Border | `#8b0000` | Cardinal red |
| Selection | `#4a1942` | Royal purple |
| Terminal | `85% opacity` | Transparent |

---

## 📦 Installation

### Prerequisites
- Arch Linux (or derivative like EndeavourOS, Manjaro)
- `git` installed
- Internet connection

### Quick Install
```bash
cd arch-niri-translucent
./install.sh
```

The install script will:
1. Install all required packages via `pacman` and `yay`
2. Copy configuration files to `~/.config/`
3. Install scripts to `~/.local/bin/`
4. Create placeholder wallpaper
5. Enable necessary services

### Manual Start
Log out and select **Niri** from your display manager, or run:
```bash
niri
```

---

## ⌨️ Keybindings

| Key | Action |
|-----|--------|
| `Mod+Enter` | Open terminal (kitty) |
| `Mod+D` | Open launcher (fuzzel) |
| `Mod+B` | Open browser (firefox) |
| `Mod+E` | Open file manager (thunar) |
| `Mod+Q` | Close window |
| `Mod+Tab` | Overview mode |
| `Mod+F` | Fullscreen |
| `Mod+Shift+Space` | Toggle floating |
| `Mod+Shift+L` | Lock screen (swaylock with blur) |
| `Mod+V` | Clipboard history |
| `Mod+1-9` | Switch workspace |
| `Mod+Ctrl+1-9` | Move window to workspace |

**Mod** = Super key (Windows/Command)

---

## 📝 Daily Bible Verse

The status bar displays a rotating Bible verse that changes every 30 minutes.

Current verses include:
- *"The Lord is my shepherd; I shall not want."* — Psalm 23:1
- *"For God so loved the world..."* — John 3:16
- *"I can do all things through Christ..."* — Philippians 4:13
- *"Thy word is a lamp unto my feet..."* — Psalm 119:105

To customize verses, edit:
```
~/.config/waybar/modules/bible-verse.sh
```

---

## 🔧 Components

| Component | Purpose |
|-------------|---------|
| **Niri** | Wayland compositor (window manager) |
| **Kitty** | Terminal (with transparency) |
| **Waybar** | Status bar with Bible verse |
| **Fuzzel** | Application launcher |
| **Mako** | Notification daemon |
| **Swaylock** | Lock screen |
| **Swww** | Wallpaper daemon |
| **Cliphist** | Clipboard history |

---

## 🖼️ Customization

### Wallpaper
Replace the placeholder:
```bash
# Copy your wallpaper
cp your-wallpaper.png ~/.config/wallpapers/cross-dark.png

# Apply
swww img ~/.config/wallpapers/cross-dark.png --transition-type fade
```

### Transparency
Edit terminal transparency in `~/.config/kitty/kitty.conf`:
```
background_opacity 0.85  # Change to 0.0-1.0
```

### Colors
Main color definitions are in:
- `kitty/kitty.conf` — Terminal colors
- `waybar/style.css` — Status bar colors
- `fuzzel/fuzzel.ini` — Launcher colors
- `mako/config` — Notification colors

---

## 📸 Screenshots

*Add your own screenshots here after installation*

---

## 🙏 Inspiration

This rice was inspired by:
- The r/unixporn community
- Christian-themed Linux rices
- The desire for a reverent, distraction-free computing environment

---

## 📄 License

These configuration files are released into the public domain.

> *"Every good gift and every perfect gift is from above."* — James 1:17
