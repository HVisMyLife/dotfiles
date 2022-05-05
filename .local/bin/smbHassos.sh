#!/bin/bash

mkdir -p /run/media/hvlife/hassos
mount -t cifs //192.168.1.10/media /run/media/hvlife/hassos -o username=hvlife,password="/\/\'"

mkdir -p /run/media/hvlife/win
mount /dev/nvme0n1p3 /run/media/hvlife/win
