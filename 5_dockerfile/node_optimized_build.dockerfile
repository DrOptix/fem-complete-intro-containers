FROM node:20-bookworm

USER node

RUN mkdir -p /home/node/app
WORKDIR /home/node/app

COPY ./node_optimized_build/package.json \
    ./node_optimized_build/package-lock.json \
    ./

RUN npm ci

COPY --chown=node:node ./node_complex ./

CMD ["node", "index.js"]
