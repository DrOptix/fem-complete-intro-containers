#/bin/bash

pushd ./kompose

docker build \
    --tag fem-kompose \
    --file ./Dockerfile \
    ./

docker compose up

popd
