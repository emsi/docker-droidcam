#!/bin/bash

export VIDEO_DEV_NO=9

sudo modprobe v4l2loopback 
sudo ./utils/v4l2loopback-ctl add -x 1 -n "droidcam" "/dev/video${VIDEO_DEV_NO}"
sudo modprobe snd-aloop

# bash has shell variable UID (which is readonly BTW)
export UID
export GID=$(stat -c'%g' /dev/video"${VIDEO_DEV_NO}")

docker-compose run --rm droidcam droidcam -dev=/dev/video"${VIDEO_DEV_NO}" $@
