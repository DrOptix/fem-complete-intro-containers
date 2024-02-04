# Build stage
FROM fedora:latest AS build

WORKDIR /build

RUN dnf -y upgrade && dnf -y install nodejs npm

COPY ./package.json \
    ./package-lock.json \
    ./

RUN npm ci

COPY ./ ./


# Runtime stage
FROM node:20-alpine AS runtime

RUN mkdir -p /home/node/app
WORKDIR /home/node/app

COPY --from=build \
    --chown=node:node \
    /build ./

CMD ["node", "index.js"]
