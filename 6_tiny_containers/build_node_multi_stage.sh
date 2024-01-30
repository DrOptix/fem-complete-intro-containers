#!/bin/bash

docker build \
    --tag "fem-dockerfile-example:node-multi-stage" \
    -f node_multi_stage.dockerfile \
    ./
