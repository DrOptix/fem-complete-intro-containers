# Build stage
FROM node:latest AS build

WORKDIR /build

COPY ./package.json ./package-lock.json ./

RUN npm ci

COPY ./ ./


# Runtime stage
FROM node:20-alpine AS runtime

RUN npm install --global nodemon

WORKDIR /home/node/code

COPY --from=build \
    --chown=node:node \
    /build ./

CMD ["nodemon", "index.js"]
