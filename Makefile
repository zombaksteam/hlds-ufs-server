docker-build:
	@-docker rmi hl-ufs-server:latest
	docker build -t hl-ufs-server:latest ./

docker-export:
	@-rm ./build/hl-ufs-server.tar
	docker save hl-ufs-server:latest > ./build/hl-ufs-server.tar

docker-import:
	@-docker rmi hl-ufs-server:latest
	docker load < ./build/hl-ufs-server.tar

docker-test:
	docker run --rm \
		--network host \
		--name hl-ufs-server-test \
		-e HL_SERVER_IP="127.0.0.1" \
		-e HL_SERVER_PORT="27015" \
		-e HLS_ADM_STEAM="STEAM_0:0:12345678" \
		-e HLS_ADM_NAME="AdminNickName" \
		-v /etc/timezone:/etc/timezone:ro \
		-it hl-ufs-server:latest

docker-push:
	docker login
	docker tag hl-ufs-server zombaksteam/hl-ufs-server:latest
	docker push zombaksteam/hl-ufs-server:latest
	docker rmi zombaksteam/hl-ufs-server:latest
	docker rmi hl-ufs-server:latest
