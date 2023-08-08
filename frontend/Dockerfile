FROM node:16.10 as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY ./ .
RUN npm run build

FROM nginx:latest
RUN mkdir /app
#ENV NODE_ENV=production
ENV VUE_APP_API_URL=/api
COPY --from=build-stage /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80


#COPY --from=builder /usr/src/app/dist /usr/share/nginx/html
#RUN rm -rf /etc/nginx/conf.d/default.conf
#COPY nginx.conf /etc/nginx/nginx.conf
#EXPOSE 80
#CMD ["nginx", "-g", "daemon off;"]
