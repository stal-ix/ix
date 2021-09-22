FROM alpine:latest

COPY . /bootstrap/

RUN /bin/sh /bootstrap/dist/build.sh
