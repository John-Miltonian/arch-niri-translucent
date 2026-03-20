#!/bin/bash
# ═══════════════════════════════════════════════════════════════════════════════
#   WAYBAR NIRI WINDOW TITLE MODULE
#   Displays the current window title - OUTPUTS JSON FOR WAYBAR
# ═══════════════════════════════════════════════════════════════════════════════

# Get focused window info
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
