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

setupxob() {
  mkfifo /tmp/xobpipe
  tail -f /tmp/xobpipe | xob -s gruvbox
}

laptopconfigs &

# run xsettingsd
run picom
run redshift
w
run xfce4-power-manager
wo wt
wo wthis
wow 
jj
run udiskie --tray
run nm-applet
wo wt
run flameshot
run blueman-applet
wo wt
run system-config-printer-applet
run redshift-gtk
wo wthi
run syncthing-gtk -m
wo wthis this isjust so coo
 wot
run greenclip daemon
this isjust so coo
run mailspring --background
this hti sth
wo wthis
run unclutter --timeout 4
~/bin/pulse-volume-watcher.py | xob -s gruvbox &
configs &
setupxob &
