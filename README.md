  gumsnap
=======

Simple app to take snapshots using the Gumstix Caspa camera and save
the resulting images as jpegs.

  Requirements
-------

The app uses OpenCV for the jpeg compression. There is an image recipe
that you can use to build the necessary components into your rootfs.

    caspa-console-image.bb


If you want streaming compression, the DSP would be a better option then
OpenCV. But for a snapshot application, pictures separated by minutes
(or hours, days) OpenCV is good enough.


  Build
-------

There is a native Makefile for building on the Gumstix.
Just run make.

There is a Makefile-cross for cross-builds using the OE tools.

Customize for your OETMP or define OETMP it in your environment,
then run make -f Makefile-cross.


  Usage
-------

        root@caspa:~/gumsnap# ./gumsnap -h
        Usage: ./gumsnap [options]

        Options:
        -b | --brightness     Brightness, 0-255, default 16
        -c | --contrast       Contrast, 0-255, default 16
        -e | --exposure       Exposure 2-566, default 480
        -g | --gain           Analog gain, 16-64, default 16
        -E | --auto-exposure  0 or 1
        -G | --auto-gain      0 or 1
        -x | --color-effects  0-2
        -H | --hflip          0 or 1
        -V | --vflip          0 or 1
        -n | --nosnap         Do not take picture
        -s | --show           Show current settings
        -h | --help           Print this message



If the -n option is not provided, gumsnap will take one picture and save
the image in the local directory as caspa.img. All parameters will be 
used if provided. The camera is turned off after the snapshot is retrieved.

The image size is 640x480 and the pixel format requested from the camera
is yuyv.

