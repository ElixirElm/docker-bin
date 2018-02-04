 # REMOVE DOCKER GARBAGE
.PHONY: docker-clean docker-clean-containers docker-clean-images

docker-clean: docker-clean-containers docker-clean-images

docker-clean-containers:
	- docker rm $(shell docker ps --no-trunc -aq)

docker-clean-images:
	- docker rmi $(shell docker images -f dangling=true -q) -f
