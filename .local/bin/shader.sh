#!/usr/bin/bash
sleep 3

if hyprctl monitors | grep -q DP-3; then
    hyprshade on nvidia
    hyprctl keyword monitor "eDP-1, disable"
    
else
    hyprshade on vibrance
fi

if ! pidof -qx waybar; then
  waybar &
fi

