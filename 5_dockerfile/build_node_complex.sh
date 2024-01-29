#!/bin/bash

docker build \
    --tag "fem-dockerfile-example:node-12-stretch-complex" \
    -f node_complex.dockerfile \
    ./
