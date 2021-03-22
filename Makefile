.PHONY: all release build push clean shell env-% tag

SERVERLESS_VERSION ?= $(shell docker run --rm node:alpine npm show serverless version)
IMAGE_NAME ?= opklnm102/serverless
IMAGE = $(IMAGE_NAME):$(SERVERLESS_VERSION)

all: release

release: build push tag clean

build: env-SERVERLESS_VERSION
	docker build --build-arg SERVERLESS_VERSION=$(SERVERLESS_VERSION) -t $(IMAGE) .

push:
	docker push $(IMAGE)

clean:
	docker image rm -f $(IMAGE)

shell:
	docker run --rm -it -v .:/opt/app $(IMAGE) bash

env-%:
	$(info Check if $* is not empty)
	@docker run --rm -e ENV_VAR=$($*) node:alpine sh -c '[ -z "$$ENV_VAR" ] && echo "Error: $* is empty" && exit 1 || exit 0'

tag:
	git tag $(SERVERLESS_VERSION)
	git push origin $(SERVERLESS_VERSION)
