#!/bin/bash

docker build \
    --tag "fem-dockerfile-example:node-static-assets" \
    -f node_static_assets.dockerfile \
    ./
