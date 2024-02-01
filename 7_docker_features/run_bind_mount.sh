#!/bin/bash

docker run \
    --mount type=bind,source="$(pwd)"/bind_mount/build,target=/usr/share/nginx/html \
    -p 8080:80 nginx:alpine
