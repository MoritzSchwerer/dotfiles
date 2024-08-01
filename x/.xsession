#! /bin/sh

# display configuration
NUM_DISPLAYS=$(xrandr | grep " connected" | awk '{ print$1 }' | wc -l)
case $NUM_DISPLAYS in
    2)
        # docked at home
        # xrandr --output DVI-I-1-1 --primary --mode 1920x1080
        xrandr --output DVI-I-1-1 --primary --mode 1920x1080 #  --pos 0x0 --rotate left
        xrandr --output eDP --off
        feh --bg-fill ~/.config/wallpapers/docked/default.png
        ;;
    *)
        # mobile anywherer
        xrandr --output eDP       --mode 1920x1080 --auto --primary
        xrandr --output DVI-I-1-1 --off
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

