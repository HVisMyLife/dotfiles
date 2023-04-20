# My dotfiles
Arch + hyprland

Use 'mode' script to change background behaviour:
 - 0 - use previous, used mainly after boot;
 - 1 - only wallpaper;
 - 2 - wallpaper + osd;
 - 3 - video;
 - 4 - video + osd;

Backgrounds are saved in .config folder as symlinks to media. 
Script will handle as many displays as you have with diffrent backgrounds.
If it fails, propably 'wlr-randr' changed output format, so you need to modify parser.
For each display you need to create accordingly named symlink (look for example).

There are configs for hyprland, sway and wayfire, choose what you prefer.

