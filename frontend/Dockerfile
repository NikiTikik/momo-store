FROM node:16-alpine as builder
WORKDIR /app
COPY package*.json ./
COPY ./ .
RUN npm install && npm run build

FROM nginx:latest
#ENV NODE_ENV=production
ENV VUE_APP_API_URL=/
COPY --from=builder /app/dist /usr/share/nginx/html
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
