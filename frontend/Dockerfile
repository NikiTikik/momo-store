FROM node:16.10 as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY ./ .
RUN npm run build

FROM nginx:latest
RUN mkdir /app
ENV VUE_APP_API_URL=http://localhost:8081
ENV NODE_ENV=production
COPY --from=build-stage /app/dist /app/static
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
