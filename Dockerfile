FROM golang:1.16-alpine as builder
WORKDIR /app
COPY go.mod ./
RUN go mod download
COPY *.go ./
RUN go build -o ff-hello-world


FROM alpine
COPY --from=builder /app/ff-hello-world /ff-hello-world

EXPOSE 8080
CMD ["/ff-hello-world"]
