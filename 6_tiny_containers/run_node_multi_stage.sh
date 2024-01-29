#!/bin/bash

docker run --rm \
    --publish 3000:3000 \
    fem-dockerfile-example:node-multi-stage $@
