#!/bin/bash

docker run \
    --rm \
    -p 3000:3000 \
    --network=mongo-net \
    --env MONGO_CONNECTION_STRING=mongodb://mongo-server:27017 \
    app-with-mongo

