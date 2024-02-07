#!/bin/bash

podman run \
    --cgroup-manager cgroupfs \
    -p 3000:3000 \
    localhost/fedora-rust-dev
  
