FROM alpine:3.21 AS base

RUN sed -i 's#https\?://dl-cdn.alpinelinux.org/alpine#https://mirrors.aliyun.com/alpine#g' /etc/apk/repositories \
    && apk update \
    && apk add --no-cache vim gcompat tzdata
ENV TZ=Asia/Shanghai
WORKDIR /app

FROM base AS build

COPY ./cmds/fliod/fliod /app/fliod
CMD ["/app/fliod", "--config", "./configs"]
