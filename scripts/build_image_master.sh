#!/bin/bash

docker build -t bigbluebutton/greenlight:master https://github.com/bigbluebutton/greenlight.git

docker login -u $DOCKER_USER -p $DOCKER_PASS
# docker push bigbluebutton/greenlight:master

docker logout
