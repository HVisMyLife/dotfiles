#!/bin/bash

mkdir -p /run/media/hvlife/hassos/First
mkdir -p /run/media/hvlife/hassos/Second
mount -t cifs //192.168.1.10/media /run/media/hvlife/hassos/First -o username=hvlife,password="/\/\'"
mount -t cifs //192.168.1.10/Data /run/media/hvlife/hassos/Second -o username=hvlife,password="/\/\'"

mkdir -p /run/media/hvlife/win
mount /dev/nvme0n1p3 /run/media/hvlife/win
