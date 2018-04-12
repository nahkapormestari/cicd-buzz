#!/bin/sh
docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
DOCKER_PATH=$DOCKER_USER:$TAG

docker build -f Dockerfile -t $DOCKER_PATH .
docker push $DOCKER_PATH
