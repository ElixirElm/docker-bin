 # make docker-deploy-<env>
.PHONY: docker-deploy-env-%
docker-deploy-env-%: docker/docker-compose-%.yml
	echo Deploying stack $(DOCKER_STACK_NAME)_$*
	docker stack deploy -c $< $(DOCKER_STACK_NAME)_$*

## BUILDING A SERVICE

# make docker/docker-compose-<env>.ytml
#   Build compose file for an <env>
docker/docker-compose-%.yml: docker/template-docker-compose.yml
	. docker/$*.env.sh && \
	envsubst < docker/template-docker-compose.yml \
	| sed '/#NO_$*/d' > $@

.PHONY: docker-compose-files
docker-compose-files: docker/docker-compose-local.yml docker/docker-compose-prod.yml docker/docker-compose-dev.yml
