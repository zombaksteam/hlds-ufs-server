# HL 1.6 Server UFS

This is UFS image for Half-Life 1.6 server

## How to test image

```bash
docker run --rm \
 --network host \
 --name hl-ufs-server-test \
 -e HL_SERVER_IP="127.0.0.1" \
 -e HL_SERVER_PORT="27015" \
 -e HLS_ADM_STEAM="STEAM_0:0:12345678" \
 -e HLS_ADM_NAME="AdminNickName" \
 -v /etc/timezone:/etc/timezone:ro \
 -it hl-ufs-server:latest
```

## How to run server

```bash
docker run -d \
 --network host \
 --restart=always \
 --name hl-ufs-server \
 -e HL_SERVER_IP="127.0.0.1" \
 -e HL_SERVER_PORT="27015" \
 -e HLS_ADM_STEAM="STEAM_0:0:12345678" \
 -e HLS_ADM_NAME="AdminNickName" \
 -v /etc/timezone:/etc/timezone:ro \
 -v /host-server/logs/hlds/:/home/steam/server/valve/logs/ \
 -v /host-server/logs/amx/:/home/steam/server/valve/addons/amxmodx/logs/ \
 -it hl-ufs-server:latest
```

## How to attach to console

```bash
docker attach --detach-keys="ctrl-a,c" hl-ufs-server
```

## How to dettach from console

Simple press `Ctrl+A` and then `C`

## ENV config variables

```bash
HL_SERVER_IP   # Public server IP
HL_SERVER_PORT # Public server port
HL_SERVER_MAP  # Server start map
SYS_TICRATE    # Server ticrate
NUM_EDICTS     # Server num edicts
MAXPLAYERS     # Server max players
HLS_ADM_STEAM  # Admin SteamId
HLS_ADM_NAME   # Admin nick name
```
