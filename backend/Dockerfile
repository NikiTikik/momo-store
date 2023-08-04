FROM golang:latest as builder

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

RUN curl https://storage.yandexcloud.net/cloud-certs/CA.pem -o YandexInternalRootCA.crt

FROM alpine:latest  

RUN apk --no-cache add ca-certificates

RUN mkdir .env

WORKDIR /root/

COPY --from=builder /app/YandexInternalRootCA.crt /usr/share/ca-certificates/
RUN echo "YandexInternalRootCA.crt" >> /etc/ca-certificates.conf \
    && update-ca-certificates

COPY --from=builder /app/main .

EXPOSE 8080

CMD ["./main"] 
   

