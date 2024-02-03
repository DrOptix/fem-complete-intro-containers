#!/bin/bash

docker run \
    --rm \
    --env DATA_PATH=/data/num.txt \
    --mount type=volume,src=incrementor-data,target=/data \
    fem-incrementor
