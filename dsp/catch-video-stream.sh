#!/bin/bash

gst-launch-0.10 -v udpsrc port=4000 \
	caps='application/x-rtp, media=(string)video, clock-rate=(int)90000, encoding-name=(string)H264, sprop-parameter-sets=(string)\"Z0KAHukBQHpCAAAH0AAB1MAIAA\\=\\=\\,aM48gAA\\=\"' \
	! rtph264depay \
	! ffdec_h264 \
	! timeoverlay halign=right valign=bottom \
	! xvimagesink sync=false

