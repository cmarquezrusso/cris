FROM golang:1.18 as build-env

ARG BUILD_VERSION

WORKDIR /usr/src/app

# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
COPY go.mod go.sum ./
RUN go mod download && go mod verify

COPY . .

RUN env GOOS=linux GOARCH=arm GOARM=5 go build .

FROM gcr.io/distroless/base
COPY --from=build-env /usr/src/app/cris /usr/bin/cris 
ENTRYPOINT ["cris"]
CMD ["--help"]
