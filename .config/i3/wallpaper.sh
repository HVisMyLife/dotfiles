#!/bin/bash

xwallpaper --output eDP-1-1 --zoom ~/.config/wallP1.png
xwallpaper --output eDP-1 --zoom ~/.config/wallP1.png
xwallpaper --output DP-2 --zoom ~/.config/wallP2.png
xwallpaper --output DP-1 --zoom ~/.config/wallP2.png

sleep 3s

autorandr -c
xwallpaper --output eDP-1-1 --zoom ~/.config/wallP1.png
xwallpaper --output eDP-1 --zoom ~/.config/wallP1.png
xwallpaper --output DP-2 --zoom ~/.config/wallP2.png
xwallpaper --output DP-1 --zoom ~/.config/wallP2.png
