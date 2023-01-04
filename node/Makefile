.PHONY: all release build push pull clean shell env-% tag

SERVERLESS_VERSION ?= $(shell docker run --rm node:alpine npm show serverless version)
IMAGE_NAME ?= opklnm102/serverless
BASE_IMAGE = node:14.16.0
IMAGE_TAG = $(subst :,-,$(BASE_IMAGE))-$(SERVERLESS_VERSION)
IMAGE = $(IMAGE_NAME):$(IMAGE_TAG)

all: release

release: build push tag clean

build: env-SERVERLESS_VERSION env-BASE_IMAGE
	docker build --build-arg SERVERLESS_VERSION=$(SERVERLESS_VERSION) \
                 --build-arg BASE_IMAGE=$(BASE_IMAGE) \
                 -t $(IMAGE) .
	docker run --rm $(IMAGE) bash -c 'serverless --version | grep $(SERVERLESS_VERSION)'

push:
	docker push $(IMAGE)

pull:
	docker pull $(IMAGE)

clean:
	docker image rm -f $(IMAGE)

shell:
	docker run --rm -it -v .:/opt/app $(IMAGE) bash

env-%:
	$(info Check if $* is not empty)
	@docker run --rm -e ENV_VAR=$($*) node:alpine sh -c '[ -z "$$ENV_VAR" ] && echo "Error: $* is empty" && exit 1 || exit 0'

tag:
	git tag $(IMAGE_TAG)
	git push origin $(IMAGE_TAG)
