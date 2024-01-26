#!/bin/bash

# Build an image container based on the course instructions
docker build --tag "fem-better-chroot-exercise" .

# Run a container from the image built and automatically remove
# it when it finishes execution
docker run -it \
    --name fem-better-chroot-exercise \
    --rm \
    --privileged \
    fem-better-chroot-exercise
