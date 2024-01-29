FROM node:12-stretch

USER node

WORKDIR /home/node/app

COPY --chown=node:node index.js index.js

CMD ["node", "index.js"]
