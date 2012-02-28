  gumsnap
=======

This is a simple app for taking snapshots using the Gumstix Caspa camera 
and save the resulting images as jpegs.


NOTE: This app is designed for use with the Gumstix linux-omap3-caspapx-2.6.34
kernel and the mt9v032 driver and OMAP isp code it uses. 

This app is NOT for use with the newer kernels using the media-ctl/V4L2
interface to the OMAP ISP connected cameras. I haven't looked at any of 
that stuff and have no idea what changed for simple V4L2 apps like this.

This app is also depending on the controls and ranges exposed by the mt9v032
driver it was written for. I validated controls and ranges outside this app
and so don't include any checks for that stuff here.



  Requirements
-------

The app uses OpenCV for the jpeg compression. There is an image recipe
that you can use to build the necessary components into your rootfs.

    caspa-console-image.bb


If you want streaming compression, the DSP would be a better option then
OpenCV. But for a snapshot application, pictures separated by minutes
or hours like this was written for, OpenCV is good enough.


  Build
-------

There is a native Makefile for building on the Gumstix. Clone the repository
and run make.

There is a Makefile-cross for cross-builds using the OE tools.

Customize for your OETMP or define OETMP it in your environment, then run 

        make -f Makefile-cross


  Usage
-------

Here is a sample session.

        root@caspa:~/gumsnap# ./gumsnap -h
        Usage: ./gumsnap [options]

        Options:
        -e | --exposure       Exposure 2-566, default 480
        -g | --gain           Analog gain, 16-64, default 16
        -E | --auto-exposure  0 or 1
        -G | --auto-gain      0 or 1
        -H | --hflip          0 or 1
        -V | --vflip          0 or 1
        -n | --nosnap         Do not take picture
        -s | --show           Show current settings
        -h | --help           Print this message


        root@caspa:~/gumsnap# ./gumsnap -n -s
        exposure:480
        gain:16
        auto-exposure:1
        auto-gain:1
        hflip:1
        vflip:1

        root@caspa:~/gumsnap# ./gumsnap
        snap done, writing image


As long as -n is not in the options, gumsnap will take one picture and save
the image in the local directory as caspa.jpg. 

Any parameters will be used if provided. The camera is turned off again
after the snapshot is retrieved.

The image size is 640x480 and the pixel format requested from the camera
is yuyv.

There are some additional driver patches to the Gumstix OE repo to fix
various bugs I found. Recipes for a rootfs image with developer tools, 
the kernel and all patches can be found in the overo/ subdirectory.



