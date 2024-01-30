#!/bin/bash

docker run --rm \
    --publish 3000:80 \
    fem-dockerfile-example:node-static-assets $@
