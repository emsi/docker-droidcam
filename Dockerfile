FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y wget unzip libspeex1 libgtk-3-0
RUN apt-get install -y libasound2 sudo
RUN wget -O droidcam_latest.zip https://files.dev47apps.net/linux/droidcam_1.7.2.zip &&  unzip droidcam_latest.zip -d droidcam && cd droidcam && ./install-client
