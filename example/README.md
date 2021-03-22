# Example

## Requirement
* docker
* docker-compose

<br>

## Build
* serverless framework로 AWS CloudFormation stack을 생성한다
* `Dry Run`으로 사용할 수 있다
```sh
$ make build
```

<br>

## Deploy
* `make build`를 통해 생성된 AWS CloudFormation stack을 배포한다
* plugin에 따라 추가로 AWS API call이 발생할 수 있다
```sh
$ make deploy
```

<br>

## Testing
### Local Testing
```sh
$ make test-local
```

### AWS Lambda Testing
```sh
$ make test-lambda
```

<br>

## Debugging
* container에서 debugging이 필요한 경우 아래 command를 실행
```sh
$ make shell
```
