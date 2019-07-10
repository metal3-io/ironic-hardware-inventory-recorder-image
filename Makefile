.PHONY: help
help:
	@echo "Targets:"
	@echo "  docker       -- try to build the docker container"

.PHONY: docker
docker:
	docker build . -f Dockerfile
