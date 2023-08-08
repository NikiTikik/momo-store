FROM node:8 as builder
WORKDIR /app
COPY package*.json ./
COPY ./ .
RUN npm install
RUN npm install -g
RUN npm run build

FROM nginx:latest
#ENV NODE_ENV=production
ENV VUE_APP_API_URL=/
COPY --from=builder /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80

#COPY --from=builder /usr/src/app/dist /usr/share/nginx/html
#RUN rm -rf /etc/nginx/conf.d/default.conf
#COPY nginx.conf /etc/nginx/nginx.conf
#EXPOSE 80
#CMD ["nginx", "-g", "daemon off;"]
