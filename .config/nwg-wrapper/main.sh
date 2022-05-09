#!/usr/bin/zsh

time=$(TZ='Europe/Warsaw' date +'%H:%M:%S')
date=$(date +'%F')
time2=$(uptime -p)

NAME=$(uname -r)

echo '<span size="30000" foreground="#ffffff" face="monospace" weight="bold">'${time}'</span>'

echo '<span size="15000" face="monospace" foreground="#ffffff">'

echo "Date: ${date}"
echo "Uptime: ${time2}"
echo "Kernel: ${NAME}"

/home/hvlife/Documents/Programming/Rust/sys_monitor/target/release/sys_monitor

echo '</span>'
