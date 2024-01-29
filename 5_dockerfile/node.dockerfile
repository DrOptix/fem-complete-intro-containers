FROM node:12-stretch

COPY index.js index.js

USER node

CMD ["node", "index.js"]
