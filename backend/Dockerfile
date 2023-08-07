FROM golang:1.18
ARG VERSION=${VERSION}
LABEL name="momo-back" \
      version=${VERSION}
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build ./cmd/api/
EXPOSE 8081

CMD ["./api"]
