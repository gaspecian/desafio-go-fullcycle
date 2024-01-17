# syntax=docker/dockerfile:1

FROM golang:1.21.6-alpine as builder

WORKDIR /app

COPY . .

RUN go build -o /desafio-fullcycle-rocks

FROM scratch

WORKDIR /

COPY --from=builder /desafio-fullcycle-rocks /desafio-fullcycle-rocks

ENTRYPOINT [ "/desafio-fullcycle-rocks" ]