# Configuration Audit Report
## Arch Niri Rice - Internal Issues Found

### 🔴 CRITICAL ISSUES

#### 1. Niri Config - swww startup broken
**File:** `config/niri/config.kdl`
**Line:** 52
**Issue:** Uses deprecated `swww init` command
**Current:**
```kdl
spawn-at-startup "sh" "-c" "swww init && swww img ~/.config/wallpapers/cross-dark.png --transition-type fade"
```
**Should be:**
```kdl
spawn-at-startup "swww-daemon"
spawn-at-startup "sh" "-c" "sleep 2 && swww img ~/.config/wallpapers/cross-dark.png --transition-type fade"
```

#### 2. Waybar Config - Invalid "custom/workspaces" module
**File:** `config/waybar/config.jsonc`
**Issue:** Waybar doesn't have a built-in `niri/workspaces` module - using custom script that won't work properly
**Problem:** The `niri-workspaces.sh` script doesn't output valid JSON for Waybar and uses deprecated syntax

#### 3. Waybar Config - "custom/window" script broken
**File:** `config/waybar/modules/niri-window.sh`
**Issue:** Script outputs plain text, not JSON. Waybar custom modules expect JSON output.
**Current:**
```bash
printf "  %s" "$title"
```
**Should be:**
```bash
echo "{\"text\":\"  $title\",\"class\":\"window-title\"}"
```

---

### 🟡 WARNINGS

#### 4. Missing xdg-desktop-portal configs
**Issue:** No XDG desktop portal configuration for screen sharing, file opening
**Should add:** `config/xdg-desktop-portal/` configs

#### 5. No greetd/ly display manager config
**Issue:** While Ly is listed in dependencies, there's no configuration file for it
**Should add:** `config/greetd/config.toml` or `config/ly/config.ini`

#### 6. GTK/Qt theming inconsistent
**Issue:** No GTK3/GTK4/Qt theming configs to match the dark Christian aesthetic
**Should add:** 
- `config/gtk-3.0/settings.ini`
- `config/gtk-4.0/settings.ini`
- `config/qt5ct/qt5ct.conf`

#### 7. Missing cursor theme config
**Issue:** No cursor theme specified - will use default
**Should add:** `~/.icons/default/index.theme`

---

### 🟢 MINOR ISSUES

#### 8. Fastfetch config uses potentially unsupported escape codes
**File:** `config/fastfetch/config.jsonc`
**Issue:** Uses `{#31}` color codes which may not work in all fastfetch versions

#### 9. No foot terminal alternative config
**Issue:** Some users prefer `foot` over `kitty` for Wayland-native terminal

#### 10. Clipboard module in Waybar uses wrong icon
**File:** `config/waybar/config.jsonc`
**Issue:** Uses `` which may not render on all fonts

---

### 📋 RECOMMENDED FIXES

#### Fix swww startup (CRITICAL)
Edit `config/niri/config.kdl` line 52:
```kdl
// Wallpaper (dark christian theme) - FIXED
spawn-at-startup "swww-daemon"
spawn-at-startup "sh" "-c" "sleep 2 && swww img ~/.config/wallpapers/cross-dark.png --transition-type fade"
```

#### Fix Waybar window module (CRITICAL)
Edit `config/waybar/modules/niri-window.sh`:
```bash
#!/bin/bash
# Output JSON for Waybar

title=$(niri msg --json focused-window 2>/dev/null | jq -r '
    if . == null then "Desktop"
    elif .title != null and .title != "" then 
        .title | if length > 50 then .[0:47] + "..." else . end
    elif .app_id != null then .app_id
    else "Window"
    end
')

# Output valid Waybar JSON
echo "{\"text\":\"  $title\",\"tooltip\":\"$title\",\"class\":\"window-title\"}"
```

#### Fix Waybar workspaces module (CRITICAL)
Replace `config/waybar/modules/niri-workspaces.sh`:
```bash
#!/bin/bash
# Simple workspace indicator for Waybar with Niri

# Get active workspace
active_ws=$(niri msg -j workspaces 2>/dev/null | jq -r '.[] | select(.is_active == true) | .idx')

# If no output, default to 1
[ -z "$active_ws" ] && active_ws=1

# Generate simple text output
output=""
for i in {1..9}; do
    if [ "$i" -eq "$active_ws" ]; then
        output="${output}● "  # Filled circle for active
    else
        output="${output}○ "  # Empty circle for inactive
    fi
done

echo "$output"
```

#### Add GTK theming
Create `config/gtk-3.0/settings.ini`:
```ini
[Settings]
gtk-theme-name=Adwaita-dark
gtk-icon-theme-name=Papirus-Dark
gtk-font-name=JetBrains Mono 11
gtk-cursor-theme-name=Adwaita
gtk-cursor-theme-size=24
gtk-enable-animations=true
gtk-application-prefer-dark-theme=true
```

---

### ✅ VERIFIED WORKING

These components are correctly configured:
- ✅ Niri keybindings (valid KDL syntax)
- ✅ Kitty terminal config (valid syntax)
- ✅ Fuzzel launcher config (valid INI)
- ✅ Mako notifications (valid config)
- ✅ Swaylock config (valid)
- ✅ Bible verse scripts (valid bash)
- ✅ Install script (valid bash, correct packages)
- ✅ Waybar CSS (valid CSS)

---

### 📊 SUMMARY

| Category | Count |
|----------|-------|
| Critical Issues | 3 |
| Warnings | 4 |
| Minor Issues | 3 |
| Working | 8 |

**Recommendation:** Fix the 3 critical issues before using this rice, especially the swww startup and Waybar JSON output.
