FROM alpine:latest

COPY . /bootstrap/

RUN --mount=type=secret,id=aws /bin/sh /bootstrap/dist/build.sh
