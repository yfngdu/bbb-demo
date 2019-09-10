#!/bin/bash

docker build -t amyblindside1/greenlight:master https://github.com/bigbluebutton/greenlight.git

docker login -u $DOCKER_USER -p $DOCKER_PASS
docker push amyblindside1/greenlight:master

docker logout
