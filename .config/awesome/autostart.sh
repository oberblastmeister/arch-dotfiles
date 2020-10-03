#!/usr/bin/env sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@" &
  fi
}

laptopconfigs() {
    YADM_CLASS=$(yadm config local.class)
    if [[ $YADM_CLASS = Laptop ]]; then
        # pulseaudio --start
        # autorandr --change
        amixer -c 0 set Master playback 100% unmute
        xinput set-prop "SYNA2B31:00 06CB:CD3E Touchpad" "libinput Tapping Enabled" 1
        xinput set-prop "SYNA2B31:00 06CB:CD3E Touchpad" "libinput Natural Scrolling Enabled" 1
        xinput set-prop "SYNA2B31:00 06CB:CD3E Touchpad" "libinput Disable While Typing Enabled" 0
        # allow two finger click
        xinput set-prop "SYNA2B31:00 06CB:CD3E Touchpad" "libinput Click Method Enabled" 0 1
        # allow two finger right click and middle click emulation
        xinput set-prop "SYNA2B31:00 06CB:CD3E Touchpad" "libinput Middle Emulation Enabled" 1
    fi
}

configs() {
    xrdb ~/.Xresources &

    xset r rate 500 50 &

    setxkbmap -option ctrl:nocaps &

    # Change from ugly 'X' cursor when hovering over background
    xsetroot -cursor_name left_ptr &
}

laptopconfigs &

run picom
run redshift
run xfce4-power-manager
run udiskie --tray
run nm-applet
run flameshot
run blueman-applet
run syncthing-gtk -m

configs &
