#!/bin/bash

docker build \
    --tag "fem-dockerfile-example:node-20-bookworm-optimized-build" \
    -f node_optimized_build.dockerfile \
    ./
