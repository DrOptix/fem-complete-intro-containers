#!/bin/bash

docker network create --driver=bridge mongo-net

docker run \
    -it \
    --rm \
    --network=mongo-net \
    mongo:3 \
    mongo --host mongo-server
