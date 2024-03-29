#!/bin/bash

docker run --rm \
	-it \
	--mount type=bind,source="$(pwd)/hugo-example",target=/src \
	-p 1313:1313 \
	-u hugo \
	jguyomard/hugo-builder:0.55 \
	hugo server -w --bind=0.0.0.0
