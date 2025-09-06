#! /bin/sh

# set display rotation
ROTATE_VERTICAL=false

# display configuration
NUM_DISPLAYS=$(xrandr | grep " connected" | awk '{ print$1 }' | wc -l)
case $NUM_DISPLAYS in
    2)
        # docked at home
        DISPLAYS=$(xrandr | grep " connected" | awk '{ print $1 }')
        OTHER_DISPLAY=$(echo "$DISPLAYS" | grep -v "eDP" | head -1)

        if $ROTATE_VERTICAL; then
            ROTATION_FLAG="--rotate left"
        else
            ROTATION_FLAG="--rotate normal"
        fi
        xrandr --output "$OTHER_DISPLAY" --primary --mode 1920x1080 --rate 60 $ROTATION_FLAG --pos 0x0
        xrandr --output eDP --off
        feh --bg-fill ~/.config/wallpapers/docked/default.png
        ;;
    *)
        # mobile anywhere
        xrandr --output eDP       --mode 1920x1080 --auto --primary
        xrandr --output DVI-I-1-1 --off
        xrandr --output HDMI-A-0 --off
        feh --bg-fill ~/.config/wallpapers/docked/default.png
        ;;
esac

# Compositor
picom -b

# Network Manager Applet
nm-applet --indicator &

export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="thorium-browser"
export ZETTELKASTEN_ROOT=$HOME/.telekasten/

# XDG Paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share



exec i3

