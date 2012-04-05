Binaries can be found at http://www.jumpnowtek.com/caspa


MLO-overo-1.5.0+r24+gitr358f33dcae0f7c57600b80b02dfce6147160aeb3-r24

u-boot-overo.bin -> u-boot-overo-2011.09+r75+gitr4be3f92ac9abd019b60ec6a63ead29a528664ead-r75.bin

uImage-overo.bin -> uImage-2.6.34-r103-overo.bin

caspa-qt-console-image-overo.tar.bz2

pwm.ko


eth0 should try a dhcp connection automatically.


You'll probably want to make this link

    ln -s /usr/bin/qmake2 /usr/bin/qmake

You'll also have to import the Qt environment found here

    /usr/share/qt4/environment-setup

You can add it to your .profile

    root@overo:~# cat .profile
    source /usr/share/qt4/environment-setup




