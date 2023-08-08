FROM node:16-alpine as builder
WORKDIR /app
COPY package*.json ./
COPY ./ .
ENV NODE_ENV=/
ENV VUE_APP_API_URL=/
#RUN npm install && npm run build
RUN npm install --cache .npm --prefer-offline && npm run build

FROM nginx:latest
COPY --from=builder /app/dist /usr/share/nginx/html
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
