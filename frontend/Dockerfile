FROM node:8 AS builder
ARG VUE_APP_API_URL=http://localhost:8081
WORKDIR /app
COPY . .
RUN npm install
RUN npm install -g
RUN npm run build

FROM nginxproxy/nginx-proxy
WORKDIR /app/
COPY --from=builder /app/dist /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
