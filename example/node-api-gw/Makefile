.PHONY: all clean _clean build _build deploy _deploy remove _remove shell deps _deps
.PHONY: test-local _test-local test-lambda _test-lambda test-local-offline _test-local-offline logs _logs

SERVERLESS_RUN = docker-compose run --rm --service-ports serverless
LAMBDA_FUNCTION = example-lambda-function

all: deps deploy clean

clean:
	$(SERVERLESS_RUN) make _clean

_clean:
	rm -rf ./node_modules ./.serverless

build: deps
	$(SERVERLESS_RUN) make _build

_build:
	sls package

deploy:
	$(SERVERLESS_RUN) make _deploy

_deploy:
	sls deploy --verbose

remove:
	$(SERVERLESS_RUN) make _remove

_remove:
	sls remove --verbose

shell:
	 $(SERVERLESS_RUN) bash

deps:
	$(SERVERLESS_RUN) make _deps

_deps:
	npm install

test-local: deps
	$(SERVERLESS_RUN) make _test-local

_test-local:
	sls invoke local --function $(LAMBDA_FUNCTION)

test-lambda: deps
	$(SERVERLESS_RUN) make _test-lambda

_test-lambda:
	sls invoke --function $(LAMBDA_FUNCTION)

.PHONY: test-local-offline
test-local-offline: deps
	$(SERVERLESS_RUN) make test-local-offline

.PHONY: _test-local-offline
_test-local-offline: deps
	sls offline start

.PHONY: logs
logs:
	$(SERVERLESS_RUN) make _logs

.PHONY: _logs
_logs:
	sls logs --function $(LAMBDA_FUNCTION) --tail
