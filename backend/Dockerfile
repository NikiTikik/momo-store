FROM golang:1.18
ARG VERSION=${VERSION}
WORKDIR /app
COPY go.mod ./
COPY go.sum ./
RUN go mod download
COPY . .
RUN go build ./cmd/api/
EXPOSE 8081

CMD ["./api"]
