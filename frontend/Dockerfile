FROM node:8 AS builder
ARG VUE_APP_API_URL=/

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY ./ .
RUN npm run build

FROM nginxproxy/nginx-proxy
COPY --from=builder /app/dist /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/nginx.conf


EXPOSE 80
