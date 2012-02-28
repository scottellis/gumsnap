setenv bootargs "console=ttyS2,115200n8 mpurate=720 mem=96M@0x80000000 mem=384M@0x88000000 i2c_bus=3,100 root=/dev/mmcblk0p2 rw rootfstype=ext3 rootwait"
setenv loadaddr 0x82000000
fatload mmc 0 ${loadaddr} uImage
bootm ${loadaddr}

