CONTAINER_ID=$(shell docker ps | grep $(1) | tr -s ' ' | cut -d' ' -f1 | head -n1)

## ACCESSING A SERVICE

# make attach-<service name>
.PHONY: docker-attach-service-%
docker-attach-service-%:
	docker attach --sig-proxy=false $(call CONTAINER_ID, $*)

# make bash-<service name>
.PHONY: docker-bash-service-%
docker-bash-service-%:
	docker exec -it $(call CONTAINER_ID, $*) bash

.PHONY: docker-sh-service-%
docker-sh-service-%:
	docker exec -it $(call CONTAINER_ID, $*) sh

.PHONY: docker-exec-service-%
docker-exec-service-%:
	docker exec -it $(call CONTAINER_ID, $*) $(EXEC)

