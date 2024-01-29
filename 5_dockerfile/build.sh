#!/bin/bash

docker build --tag "fem-dockerfile-example:1" -f 1.Dockerfile .

docker build --tag "fem-dockerfile-example:2" -f 2.Dockerfile .
