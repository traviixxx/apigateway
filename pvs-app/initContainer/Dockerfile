FROM geocomply.jfrog.io/apps-gc-pvs-docker-dev-local/golang:1.19.3-alpine3.16

WORKDIR /app

COPY . .

RUN go mod tidy
