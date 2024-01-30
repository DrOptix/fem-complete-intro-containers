#!/bin/bash

docker build \
    --tag "fem-dockerfile-example:node-alpine" \
    -f node_alpine.dockerfile \
    ./
