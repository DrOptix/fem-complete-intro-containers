FROM node:20-bookworm

USER node

RUN mkdir -p /home/node/app
WORKDIR /home/node/app

COPY --chown=node:node ./node_complex ./

RUN npm ci

CMD ["node", "index.js"]
