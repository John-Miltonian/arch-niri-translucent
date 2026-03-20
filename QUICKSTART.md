# Quick Start Guide

## First Steps After Installation

### 1. Start Niri
```bash
# From TTY
niri

# Or log out and select "Niri" from your display manager
```

### 2. Essential Keybindings

| Key | Action |
|-----|--------|
| `Mod+Enter` | Open terminal |
| `Mod+D` | Open launcher |
| `Mod+Q` | Close window |
| `Mod+Tab` | Overview mode |
| `Mod+1-9` | Switch workspace |

### 3. Common Tasks

**Open Browser:**
```
Mod+D → type "firefox" → Enter
```

**Screenshot:**
```
Print → saves to ~/Pictures/Screenshots/
```

**Change Volume:**
```
XF86AudioRaiseVolume / XF86AudioLowerVolume (media keys)
```

**Lock Screen:**
```
Mod+Shift+L
```

### 4. Bible Verse

The center of your status bar displays a daily scripture. It rotates every 30 minutes.

To see the current verse tooltip, hover over it.

---

## Customization

### Change Wallpaper
```bash
swww img /path/to/your/wallpaper.png --transition-type fade
```

### Adjust Terminal Transparency
Edit `~/.config/kitty/kitty.conf`:
```
background_opacity 0.85
```

### Add Your Own Bible Verses
Edit `~/.config/waybar/modules/bible-verse.sh` and add to the verses array.

---

## Troubleshooting

**Waybar not showing:**
```bash
killall waybar
waybar &
```

**Niri won't start:**
- Ensure you're on a TTY or using a display manager
- Check that your GPU drivers are installed

**Transparency not working:**
- Niri doesn't support compositor-level transparency
- Use terminal/app-level transparency (kitty supports this natively)
