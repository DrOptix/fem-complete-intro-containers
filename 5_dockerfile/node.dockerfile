FROM node:12-stretch

COPY index.js index.js
RUN chown node:node index.js

USER node

CMD ["node", "index.js"]
