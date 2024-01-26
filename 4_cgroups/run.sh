#!/bin/bash

# Build an image container based on the course instructions
sudo docker build --tag "fem-cgroups-exercise" .

# Run a container from the image built and automatically remove
# it when it finishes execution
sudo docker run -it \
    --name fem-cgroups-exercise \
    --rm \
    --privileged \
    fem-cgroups-exercise
