SHELL := /bin/bash

.PHONY: build up down shell status

export IMAGE_NAME = arris/dev:latest
export CONTAINER_NAME = dev

build:
	docker build -t ${IMAGE_NAME} .

up:
	docker run --name ${CONTAINER_NAME} --rm -it ${IMAGE_NAME} bash 

down: export CONTAINER_IDS := $(shell docker ps -qa --no-trunc --filter "status=exited")
down:
	docker rm $(CONTAINER_IDS)

shell:
	docker exec -it ${CONTAINER_NAME} /bin/bash

status:
	docker ps -a
