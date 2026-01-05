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
        xrandr --output "$OTHER_DISPLAY" --primary --mode 3840x2160 --rate 60 $ROTATION_FLAG --pos 0x0
        xrandr --output eDP --off
        convert -size 1x1 xc:black /tmp/black_pixel.png
        # feh --bg-fill ~/.config/wallpapers/docked/default.png
        feh --bg-scale /tmp/black_pixel.png
        export GDK_SCALE=1.5
        export GDK_DPI_SCALE=0.75
        ;;
    *)
        # mobile anywhere
        xrandr --output eDP       --mode 1920x1080 --auto --primary
        xrandr --output DVI-I-1-1 --off
        xrandr --output HDMI-A-0 --off
        convert -size 1x1 xc:black /tmp/black_pixel.png
        # feh --bg-fill ~/.config/wallpapers/docked/default.png
        feh --bg-scale /tmp/black_pixel.png
        ;;
esac

# Compositor
picom -b --no-fading-openclose

# Network Manager Applet
# nm-applet --indicator &

export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="thorium-browser"
export ZETTELKASTEN_ROOT=$HOME/.telekasten/
export PATH="$HOME/.local/bin:$PATH"
# XDG Paths
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share



exec i3 && startup

