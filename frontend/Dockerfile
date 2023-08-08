FROM node:16-alpine as builder

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:stable-alpine
ARG VERSION=${VERSION}
LABEL name="momo-frontend" \
      version=${VERSION}
WORKDIR /usr/src/app
ENV NODE_ENV=production
ENV VUE_APP_API_URL=/api
COPY --from=builder /usr/src/app/dist /usr/share/nginx/html
RUN rm -rf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-c", "/etc/nginx/nginx.conf", "-g", "daemon off;"]
