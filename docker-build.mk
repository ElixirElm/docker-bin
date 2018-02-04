.PHONY: docker-build
# make docker-build-local-image-<image>
#   Only local image is built here. The other images are tagged versions of it.
docker-build: docker-release.tar
	docker build -t $(IMAGE_NAME):local .

RELEASE_FILES=.
TAR_OPTIONS=

docker-release.tar: compile
	tar -cf \
	  $@ $(RELEASE_FILES) $(TAR_OPTIONS)\
	  --exclude=$@ \
	  --exclude-backups \
	  --exclude-vcs \
	  --exclude-vcs-ignores

#You need to define "compile" in your project
#phoenix.mk already defines it if you are using it
