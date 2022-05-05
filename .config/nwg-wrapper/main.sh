#!/usr/bin/zsh

time=$(TZ='Europe/Warsaw' date +'%H:%M:%S')
date=$(date +'%F')
time2=$(uptime -p)

NAME=$(uname -r)

isN=0
# /home/hvlife/.local/bin/crypto & disown %1
if nc -zw1 google.com 443; then

WLP=$(ip address | awk '/2:/ {print $2}')
WLP=${WLP:0:-1}
WIP=$(curl -s icanhazip.com)
IP=$(ip address | awk '/192/ { print $2 }')
IP=${IP:0:-3}
TN=$(sensors | grep -A 2 iwlwifi | grep temp1 | cut -c 16-23)
isN=1
fi

TC0=$(sensors | grep Core\ 0: | cut -c 17-23)
TC1=$(sensors | grep Core\ 1: | cut -c 17-23)
TC2=$(sensors | grep Core\ 2: | cut -c 17-23)
TC3=$(sensors | grep Core\ 3: | cut -c 17-23)
TNV=$(sensors | grep Composite: | cut -c 16-23)

DF=$(df | awk '/nvme/ {print $5 "\ " $6} /sda/ {print $5 "\ " $6}')

MM=$(free --mega | grep Mem: | cut -c 16-33)
MS=$(free --mega | grep Swap: | cut -c 16-33)

echo '<span size="30000" foreground="#ffffff" face="monospace" weight="bold">'${time}'</span>'

echo '<span size="15000" face="monospace" foreground="#ffffff">'

echo "Date: ${date}"
echo "Uptime: ${time2}"
echo "Kernel: ${NAME}"

if [[ ${isN} -ge 1 ]] 
then

echo "\n--------NET--------" 
echo "WW IP: ${WIP}"
echo "WLAN IP: ${IP}"
echo "NetCard: ${WLP}"
echo "Temp: ${TN}"

fi

echo "\n--------CPT--------"
cat /home/hvlife/.config/crypto

echo "\n--------CPU--------"
echo "Usage: $(cat /home/hvlife/.config/cpu)%"
echo "CPU_0_TEMP ${TC0}"
echo "CPU_1_TEMP ${TC1}"
echo "CPU_2_TEMP ${TC2}"
echo "CPU_3_TEMP ${TC3}"

echo "\n--------DSC--------"
echo "${DF}"

echo "\n--------MEM--------"
echo "RAM ${MM}"
echo "SWAP${MS}"

echo '</span>'
