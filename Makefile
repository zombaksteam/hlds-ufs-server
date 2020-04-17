dirs:
	@-mkdir build

build: dirs
	@-docker rmi hl-ufs-server:latest
	docker build -t hl-ufs-server:latest ./docker

export:
	@-rm ./build/*
	docker save hl-ufs-server:latest > ./build/hl-ufs-server.tar

import:
	@-docker rmi hl-ufs-server:latest
	docker load < ./build/hl-ufs-server.tar
