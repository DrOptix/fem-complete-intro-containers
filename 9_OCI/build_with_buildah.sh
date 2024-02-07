#!/bin/bash

buildah build-using-dockerfile \
    -f ./Dockerfile \
    -t fedora-rust-dev
