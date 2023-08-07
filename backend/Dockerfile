FROM golang:latest as builder
#FROM golang:1.18
#ARG VERSION=${VERSION}

WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
#RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo ./cmd/api
RUN go build ./cmd/api/

FROM alpine:latest  
COPY --from=builder app/cmd/api .

EXPOSE 8081
CMD ["./api"] 
