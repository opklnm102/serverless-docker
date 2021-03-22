# serverless-docker
A docker container for running serverless commands

<br>

## Requirement
* docker
* docker-compose

<br>

## serverless framework docker image build
* 아래 command면 최신 버전의 serverless framework가 build되어 git tag, dockerhub에 push까지 된다
```sh
$ make
``` 

## Installation
```shell script
$ make bootstrap
```

## Usage
```shell script
$ make run
```

<br>

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

<br>

## License
[MIT](https://choosealicense.com/licenses/mit/)

<br><br>

> #### Reference 
> * [Serverless Framework Docs](https://www.serverless.com/framework/docs/)
