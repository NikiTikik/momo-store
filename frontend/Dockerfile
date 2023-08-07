FROM node:8 AS builder
ARG VUE_APP_API_URL=http://localhost:8081

WORKDIR /app
COPY package*.json ./
#RUN npm install
COPY ./ .
ENV NODE_ENV=/
ENV VUE_APP_API_URL=/
RUN npm install --cache .npm --prefer-offline && npm run build
#RUN npm run build

FROM nginxproxy/nginx-proxy
COPY --from=builder /app/dist /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
