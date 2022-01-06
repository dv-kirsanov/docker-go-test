FROM golang:bullseye as build
WORKDIR /opt/app
ADD . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build
CMD ["./docker-demo-2"]

FROM scratch
WORKDIR /opt/app
COPY --from=build /opt/app/docker-demo-2 ./
CMD ["./docker-demo-2"]
