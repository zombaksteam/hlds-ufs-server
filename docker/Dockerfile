FROM hl-amx-server:latest

ENV HLS_ADM_STEAM=\
	HLS_ADM_NAME=AdminNickName

ARG DEBIAN_FRONTEND=noninteractive

USER root
COPY ./server/valve /home/steam/server/valve
COPY ./run.sh /home/steam/server/run.sh

RUN chown -R steam:steam /home/steam/server/ && \
	chown steam:steam /home/steam/server/run.sh

USER steam
