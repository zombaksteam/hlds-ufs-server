FROM hl-amx-server:latest
MAINTAINER zombaksteam <zombaksteam@gmail.com>

ENV HL_SERVER_IP=127.0.0.1 \
	HL_SERVER_PORT=27015 \
	HL_SERVER_MAP=crossfire \
	SYS_TICRATE=500 \
	NUM_EDICTS=2047 \
	MAXPLAYERS=32 \
	HLS_ADM_STEAM=\
	HLS_ADM_NAME=AdminNickName

ARG DEBIAN_FRONTEND=noninteractive

COPY --chown=steam:steam ./server/valve /home/steam/server/valve
COPY --chown=steam:steam ./run.sh /home/steam/server/run.sh

USER steam
CMD /home/steam/server/run.sh
