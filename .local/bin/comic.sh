#!/usr/bin/env bash

# Background color
BG="#000000"
# Foreground color
FG="#101080"

# A place to store the downloaded the comic
COMIC_LOC="$HOME/.cache/comics/comic.png"
# A place to store the recolored version of the comic
COMIC_RECOL="$HOME/.cache/comics/recolor.png"
# The base image
BG_DEF="$HOME/.cache/comics/default.png"
BG_DEF_2="$HOME/.cache/comics/default"
# The output image
OUT="$HOME/.cache/comics/output.png"

# Get current comic number
COMIC_URL="$(curl -s 'https://xkcd.com/info.0.json' | jq -r .img)"
# Download the comic
wget $COMIC_URL -O $COMIC_LOC
# Change the colors of the comic
convert $COMIC_LOC +level-colors $FG,$BG $COMIC_RECOL
# Create base img
#convert -size 1920x1080 xc:$BG $BG_DEF
geomandel -w 3440 -h 1440 --image-png -m 8 -b 24 \
--cima-min=0.0 --cima-max=9.0 --creal-min=0.0 --creal-max=21.5 \
--zoom=5 --xcoord=-40.0 --ycoord=0.0 --rgb-base=0,0,0 --rgb-freq=0,0,8.0 \
--image-file $BG_DEF_2
# Put the comic on the original image
convert -composite -gravity center $BG_DEF $COMIC_RECOL $OUT
