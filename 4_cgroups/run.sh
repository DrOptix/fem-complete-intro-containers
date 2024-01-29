#!/bin/bash

# Run a container from the image built and automatically remove
# it when it finishes execution
docker run -it \
    --name fem-cgroups-exercise \
    --rm \
    --privileged \
    fem-cgroups-exercise
