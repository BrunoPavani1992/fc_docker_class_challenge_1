FROM golang:1.16-alpine AS builder

WORKDIR /app

COPY hello.go .

RUN go build -ldflags -"w" hello.go

FROM scratch

WORKDIR /app

COPY --from=builder /app/ .

CMD [ "./hello"]