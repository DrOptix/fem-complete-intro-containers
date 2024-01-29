# Build stage
FROM fedora:latest AS build

WORKDIR /build

RUN dnf -y upgrade && dnf -y install nodejs npm

COPY ./node_multi_stage/package.json \
    ./node_multi_stage/package-lock.json \
    ./

RUN npm ci

COPY ./node_multi_stage/ ./


# Runtime stage
FROM alpine:latest AS runtime

RUN apk add --update nodejs

RUN addgroup -S node && adduser -S node -G node

USER node

RUN mkdir -p /home/node/app
WORKDIR /home/node/app

COPY --from=build --chown=node:node /build ./

CMD ["node", "index.js"]
