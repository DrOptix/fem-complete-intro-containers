# Build stage
FROM node:latest AS build

WORKDIR /build

COPY ./node_static_assets/ ./

RUN npm ci && npm run build


# Runtime stage
FROM nginx:alpine AS runtime

WORKDIR /usr/share/nginx/html

COPY --from=build /build ./
