#!/bin/bash

docker build \
    --tag "fem-dockerfile-example:node-alpine-scratch" \
    -f node_alpine_scratch.dockerfile \
    ./
