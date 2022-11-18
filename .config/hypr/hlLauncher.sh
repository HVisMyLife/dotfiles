#!/bin/zsh

# NetworkManager
nm-applet --indicator &|
dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY SWAYSOCK &|

# Polkit
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &|

# EQ
easyeffects --gapplication-service &|

# Clipboard
wl-clipboard-history -t &|

# Automount
udiskie --tray &|

# Waybar
waybar &|

# Wallpaper
mode 0 &|

# Sleep
#swayidle -w \
#         timeout 1200 'swaylock --screenshots --clock --indicator --indicator-radius 100 --indicator-thickness 7 --effect-blur 7x5 --effect-vignette 0.5:0.5 --ring-color bb00cc --key-hl-color 880033 --line-color 00000000 --inside-color 00000088 --separator-color 00000000 --grace 2 --fade-in 1' \
# timeout 12800 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
#         before-sleep 'swaylock --screenshots --clock --indicator --indicator-radius 100 --indicator-thickness 7 --effect-blur 7x5 --effect-vignette 0.5:0.5 --ring-color bb00cc --key-hl-color 880033 --line-color 00000000 --inside-color 00000088 --separator-color 00000000 --grace 2 --fade-in 1'

