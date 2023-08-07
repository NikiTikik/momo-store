FROM node:16.10 as build-stage
ENV VUE_APP_API_URL=/
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY ./ .
RUN npm run build

FROM nginx:latest
RUN mkdir -p /app/static
COPY --from=build-stage /app/dist /app/static
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
