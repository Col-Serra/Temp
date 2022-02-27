FROM python:3.9.2-slim-buster
RUN mkdir /bot && chmod 777 /bot
RUN git clone https://github.com/Col-Serra/light-Queue-Enc
WORKDIR /bot
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Africa/Lagos
RUN apt -qq update && apt -qq install -y git wget pv jq python3-dev ffmpeg mediainfo
COPY requirements.txt .
RUN pip3 install -r requirements.txt
COPY . .
#Install HandBrakeCLI
RUN echo deb http://ftp.de.debian.org/debian bullseye main  > /etc/apt/sources.list && \
apt-get update && \
apt-get install sudo -y && \
sudo apt-get install handbrake-cli -y

CMD ["bash","run.sh"]
