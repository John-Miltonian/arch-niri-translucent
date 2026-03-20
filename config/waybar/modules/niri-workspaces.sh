#!/bin/bash
# ═══════════════════════════════════════════════════════════════════════════════
#   WAYBAR NIRI WORKSPACES MODULE
#   Displays workspace indicators with biblical names
# ═══════════════════════════════════════════════════════════════════════════════

case "$1" in
    focus-workspace)
        niri msg action "$@" && pkill -SIGRTMIN+8 waybar
        ;;
    *)
        set -e
        monitor=$1
        
        # Unicode symbols for active/inactive
        active="●"
        inactive="○"
        
        # Biblical workspace names
        ws_names=("✝" "✝" "✝" "✝" "✝" "✝" "✝" "✝" "✝")
        
        workspace_str=""
        
        msg_out="$(niri msg -j workspaces | jq -r ".[] | select(.output == \"$monitor\") | .is_active")"
        
        i=0
        for ws in $msg_out; do
            if [ "$ws" = "true" ]; then
                workspace_str="${workspace_str}${active} "
            else
                workspace_str="${workspace_str}${inactive} "
            fi
            ((i++))
        done
        
        printf "%s" "$workspace_str"
        ;;
esac
