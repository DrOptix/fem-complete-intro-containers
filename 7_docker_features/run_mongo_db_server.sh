#!/bin/bash

docker network create --driver=bridge mongo-net

docker run \
    --rm \
    --name mongo-server \
    --network=mongo-net \
    -p 27017:27017 \
    mongo:3
