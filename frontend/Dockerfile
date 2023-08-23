FROM node:16-alpine as builder
WORKDIR /app
COPY package*.json ./
COPY ./ .
ENV NODE_ENV=/
ENV VUE_APP_API_URL=/
RUN npm install && npm run build

FROM nginx:latest
WORKDIR /app
COPY --from=builder /app/dist /app/static/momo-store
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
