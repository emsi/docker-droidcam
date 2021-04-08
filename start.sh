#!/bin/bash

VIDEO_DEV_NO=9

sudo modprobe v4l2loopback exclusive_caps=1 video_nr="${VIDEO_DEV_NO}" card_label="droidcam"
sudo modprobe snd-aloop

# bash has shell variable UID (which is readonly BTW)
export UID
export GID=$(stat -c'%g' /dev/video"${VIDEO_DEV_NO}")

docker-compose run --rm droidcam droidcam -dev=/dev/video"${VIDEO_DEV_NO}" $@
