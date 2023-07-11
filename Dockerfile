FROM golang:alpine AS builder

WORKDIR /usr/src/app

COPY main.go .

RUN go build -o fullcycle main.go

FROM scratch

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app .

ENTRYPOINT ["./fullcycle"]