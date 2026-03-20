#!/bin/bash
# ═══════════════════════════════════════════════════════════════════════════════
#   WAYBAR NIRI WORKSPACES MODULE
#   Displays workspace indicators with simple circle icons
# ═══════════════════════════════════════════════════════════════════════════════

# Get current active workspace
active_ws=$(niri msg -j workspaces 2>/dev/null | jq -r '.[] | select(.is_active == true) | .idx')

# Default to 1 if no output
[ -z "$active_ws" ] && active_ws=1

# Generate simple output with circles
output=""
for i in {1..9}; do
    if [ "$i" -eq "$active_ws" ]; then
        output="${output}● "  # Filled circle for active
    else
        output="${output}○ "  # Empty circle for inactive
    fi
done

echo "$output"
