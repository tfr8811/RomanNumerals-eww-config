#!/bin/bash
# ~/.config/eww/scripts/toggle_visualizer.sh
SCRIPT_NAME="cava_snapshot.sh"
SCRIPT_PATH="/home/thomasr/.config/eww/scripts/$SCRIPT_NAME"

if pgrep -f "$SCRIPT_NAME" >/dev/null; then
    pkill -f "$SCRIPT_NAME"
    eww update cava-ascii-string=$"▁▂▃▄▅▆▇█"
else
    "$SCRIPT_PATH" &
fi