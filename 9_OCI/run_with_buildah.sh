#!/bin/bash

buildah from fedora-rust-dev
buildah run \
    --net host \
    fedora-rust-dev-working-container \
    -- \
    bash
buildah rm $(buildah ps -q)
