FROM node:20-alpine

USER node

RUN mkdir -p /home/node/app
WORKDIR /home/node/app

COPY ./node_alpine/package.json \
    ./node_alpine/package-lock.json \
    ./

RUN npm ci

COPY --chown=node:node ./node_alpine ./

CMD ["node", "index.js"]
