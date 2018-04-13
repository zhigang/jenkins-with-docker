# Jenkins with docker

Install docker ce in jenkins for shell.

## Base Docker Image

* [jenkinsci/jenkins](https://store.docker.com/community/images/jenkinsci/jenkins)

## Docker Tag

* 2.107.2

## Build docker image

```bash
docker build --force-rm --no-cache -t siriuszg/jenkins-with-docker:TAG .
```

## Howto

### Quick Start

```bash
docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home siriuszg/jenkins-with-docker:lts
```