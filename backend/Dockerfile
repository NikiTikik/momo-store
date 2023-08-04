FROM golang:latest as builder

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo ./cmd/api

FROM alpine:latest  

COPY --from=builder ./cmd/api momo-store-backend-${VERSION}

EXPOSE 8080

CMD ["./momo-store-backend-${VERSION}"] 
   
