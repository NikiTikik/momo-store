FROM alpine:latest  

ARG VERSION=${VERSION}

ADD momo-store-backend-${VERSION} /momo-store-backend-1.0.0
EXPOSE 8080

CMD [ "/momo-store-backend-1.0.0" ]
