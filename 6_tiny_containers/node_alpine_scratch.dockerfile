FROM node:20-alpine

USER node

RUN mkdir -p /home/node/app
WORKDIR /home/node/app

COPY ./node_alpine_scratch/package.json \
    ./node_alpine_scratch/package-lock.json \
    ./

RUN npm ci

COPY --chown=node:node ./node_alpine_scratch ./

CMD ["node", "index.js"]
