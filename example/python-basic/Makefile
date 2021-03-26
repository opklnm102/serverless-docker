.PHONY: all clean _clean build _build deploy _deploy remove _remove shell deps _deps
.PHONY: test-local _test-local test-lambda _test-lambda

SERVERLESS_RUN = docker-compose run --rm serverless
LAMBDA_FUNCTION = example-lambda-function

all: deps deploy clean

clean:
	$(SERVERLESS_RUN) make _clean

_clean:
	rm -rf node_modules .serverless

build: deps
	$(SERVERLESS_RUN) make _build

_build:
	sls package

deploy:
	$(SERVERLESS_RUN) make _deploy

_deploy:
	sls deploy -v

remove:
	$(SERVERLESS_RUN) make _remove

_remove:
	sls remove -v

shell:
	 $(SERVERLESS_RUN) bash

deps:
	$(SERVERLESS_RUN) make _deps

_deps:
	npm install

test-local: deps
	$(SERVERLESS_RUN) make _test-local

_test-local:
	pip install -r requirements.txt
	sls invoke local --function $(LAMBDA_FUNCTION)

test-lambda: deps
	$(SERVERLESS_RUN) make _test-lambda

_test-lambda:
	sls invoke --function $(LAMBDA_FUNCTION)
