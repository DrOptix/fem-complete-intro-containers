#!/bin/bash

docker build \
    --tag "fem-dockerfile-example:node-12-stretch" \
    -f node.dockerfile \
    ./
