#!/bin/bash

docker run -it --rm \
    -p 3000:3000 \
    --privileged \
    --mount type=bind,source="$(pwd)",target=/src  \
    --mount type="volume",src=podman-data,target=/var/lib/containers \
    tomkukral/buildah \
    bash
