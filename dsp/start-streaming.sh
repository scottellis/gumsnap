#!/bin/sh

gst-launch -e v4l2src ! video/x-raw-yuv,width=640,height=480 \
    ! TIVidenc1 codecName=h264enc engineName=codecServer ! rtph264pay pt=96 \
    ! udpsink host=192.168.10.3 port=4000

