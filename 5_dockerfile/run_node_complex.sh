#!/bin/bash

docker run \
    --publish 3000:3000 \
    --rm fem-dockerfile-example:node-12-stretch-complex $@
