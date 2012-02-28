#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Usage $0 <uboot-script-file>"
	exit
fi

if [ ! -f $1 ]
then
	echo "Input script file not found: $1"
	exit
fi

if [ ! -f /usr/bin/mkimage ]; then
	echo "/usr/bin/mkimage not found"
	echo "Try: sudo apt-get install uboot-mkimage"
	exit
fi

mkimage -A arm -O linux -T script -C none -a 0 -e 0 -n $1 -d $1 boot.scr


