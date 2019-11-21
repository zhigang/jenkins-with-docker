# Jenkins with docker

Install docker ce in jenkins for shell.

## Base Docker Image

* [jenkins/jenkins](https://hub.docker.com/r/jenkins/jenkins)

## Docker Tag

* lts
* 2.205
* 2.189
* 2.174
* 2.107.2
* 2.150.1

## Build docker image

```bash
docker build --force-rm --no-cache -t siriuszg/jenkins-with-docker:TAG .
```

## Howto

### Quick Start

```bash
docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home siriuszg/jenkins-with-docker:TAG
```
