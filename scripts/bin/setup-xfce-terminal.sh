
#!/bin/bash

# Define the channel
CHANNEL="xfce4-terminal"

echo "Applying XFCE Terminal settings..."

# Colors & Appearance
xfconf-query -c $CHANNEL -p /background-mode -n -t string -s "TERMINAL_BACKGROUND_TRANSPARENT"
xfconf-query -c $CHANNEL -p /background-darkness -n -t double -s 0.91
xfconf-query -c $CHANNEL -p /color-foreground -n -t string -s "#e3e3ea"
xfconf-query -c $CHANNEL -p /color-background -n -t string -s "#08052b"
xfconf-query -c $CHANNEL -p /color-cursor -n -t string -s "#ff7f7f"
xfconf-query -c $CHANNEL -p /color-cursor-foreground -n -t string -s "#FFFFFF"
xfconf-query -c $CHANNEL -p /color-cursor-use-default -n -t bool -s false
xfconf-query -c $CHANNEL -p /color-bold -n -t string -s "#7fbaff"
xfconf-query -c $CHANNEL -p /color-palette -n -t string -s "rgb(8,5,43);rgb(255,127,127);rgb(127,63,191);rgb(204,57,128);rgb(127,186,255);rgb(127,63,191);rgb(127,127,255);rgb(205,204,219);rgb(127,186,255);rgb(255,127,127);rgb(153,153,204);rgb(255,127,127);rgb(127,127,255);rgb(127,63,191);rgb(127,127,255);rgb(227,227,234)"

# Font
xfconf-query -c $CHANNEL -p /font-name -n -t string -s "Monospace 10"
xfconf-query -c $CHANNEL -p /font-use-system -n -t bool -s true

# Scrolling
xfconf-query -c $CHANNEL -p /scrolling-bar -n -t string -s "TERMINAL_SCROLLBAR_NONE"
xfconf-query -c $CHANNEL -p /scrolling-lines -n -t uint -s 50000
xfconf-query -c $CHANNEL -p /scrolling-unlimited -n -t bool -s true

# Behavior & Misc
xfconf-query -c $CHANNEL -p /misc-menubar-default -n -t bool -s false
xfconf-query -c $CHANNEL -p /misc-cursor-blinks -n -t bool -s false
xfconf-query -c $CHANNEL -p /misc-cursor-shape -n -t string -s "TERMINAL_CURSOR_SHAPE_BLOCK"
xfconf-query -c $CHANNEL -p /misc-mouse-wheel-zoom -n -t bool -s true
xfconf-query -c $CHANNEL -p /misc-copy-on-select -n -t bool -s false
xfconf-query -c $CHANNEL -p /misc-show-unsafe-paste-dialog -n -t bool -s false
xfconf-query -c $CHANNEL -p /misc-confirm-close -n -t bool -s true

echo "Done! Restart your terminal to see the changes."
