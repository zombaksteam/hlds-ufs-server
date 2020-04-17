#!/bin/bash

# Define log file
LOG_FILE="/home/steam/server/valve/logs/server.log"

# Truncate log file at start
if [ -f ${LOG_FILE} ]; then
	# Only if file is not empty
	if [ ! -s ${LOG_FILE} ]; then
		LOG_FILENAME="log_$(date '+%FT%T').log"
		LOG_FILENAME=`echo "$LOG_FILENAME" | sed "s/-/_/g"`
		LOG_FILENAME=`echo "$LOG_FILENAME" | sed "s/:/_/g"`

		cp ${LOG_FILE} "/home/steam/server/valve/logs/${LOG_FILENAME}"

		rm ${LOG_FILE}
		touch ${LOG_FILE}
	fi
fi

# Add admin user to amx users file
if [ ${HLS_ADM_STEAM} != "" ]; then
	echo "Admin ${HLS_ADM_NAME} ${HLS_ADM_STEAM} added to users!"
	echo "\"${HLS_ADM_STEAM}\" \"${HLS_ADM_NAME}\" \"bcdefghijklmnopqrstu\" \"ce\"" > /home/steam/server/valve/addons/amxmodx/configs/users.ini
fi

# Move to server root
cd /home/steam/server

# Capture and redirect output to log file
./hlds_run +ip ${HL_SERVER_IP} \
	+port ${HL_SERVER_PORT} \
	-sys_ticrate ${SYS_TICRATE} \
	-maxplayers ${MAXPLAYERS} \
	-num_edicts ${NUM_EDICTS} \
	+map ${HL_SERVER_MAP} -debug 2>&1 | \
	tee ${LOG_FILE}
