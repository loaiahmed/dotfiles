#!/bin/bash

# Get status from any active player
PLAYER_STATUS=$(playerctl --player=spotify,kew status 2>/dev/null)

# Check if anything is actually playing or paused
if [ "$PLAYER_STATUS" = "Playing" ]; then
    ICON=""
elif [ "$PLAYER_STATUS" = "Paused" ]; then
    ICON=""
else
    exit 0 # Exit silently if no player is running
fi

# action listener
case "$BLOCK_BUTTON" in
    1) # Left click: pause-play toggle
        playerctl --player=spotify,kew play-pause
        ;;
esac

# Fetch metadata from the active player
INFO=$(playerctl --player=spotify,kew metadata --format "{{ artist }} - {{ title }}" 2>/dev/null)

# Output for i3blocks
echo "<span foreground='#00FF00'>$ICON</span> $INFO"
echo "<span foreground='#00FF00'>$ICON</span>"
