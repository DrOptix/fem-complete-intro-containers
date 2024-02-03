FROM node:12-alpine

COPY --chown=node:node ./volume_mount /app

WORKDIR /app

CMD ["node", "index.js"]
