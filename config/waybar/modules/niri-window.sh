#!/bin/bash
# ═══════════════════════════════════════════════════════════════════════════════
#   WAYBAR NIRI WINDOW TITLE MODULE
#   Displays the current window title
# ═══════════════════════════════════════════════════════════════════════════════

title=$(niri msg --json focused-window | jq -r 'if .title != null then .title | if length > 50 then .[0:47] + "..." else . end else "Desktop" end')

printf "  %s" "$title"
