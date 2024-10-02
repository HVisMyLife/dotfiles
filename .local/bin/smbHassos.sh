#!/bin/bash

mkdir -p /run/media/hvlife/win
mount /dev/nvme0n1p2 /run/media/hvlife/win

mount --mkdir -t cifs //192.168.1.10/media /run/media/hvlife/hassos/DB -o username=hvlife,password="/\/\'"
mount --mkdir -t cifs //192.168.1.10/Data /run/media/hvlife/hassos/Vid -o username=hvlife,password="/\/\'"

