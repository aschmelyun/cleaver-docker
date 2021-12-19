FROM node:current-alpine

LABEL maintainer="Andrew Schmelyun <me@aschmelyun.com>"

RUN mkdir -p /var/www
RUN mkdir -p /var/docker

WORKDIR /var/www

RUN apk update && apk add --no-cache \
    curl \
    git \
    zip \
    unzip \
    php8 \
    php8-common \
    php8-zip \
    php8-iconv \
    php8-curl \
    php8-tokenizer \
    php8-fileinfo \
    php8-json \
    php8-mbstring \
    php8-phar \
    php8-xml \
    php8-xmlwriter \
    php8-simplexml \
    php8-dom \
    php8-session \
    openssl \
    php8-openssl && \
    rm -rf /var/cache/apk/*

RUN ln -s /usr/bin/php8 /usr/bin/php

RUN curl -sS https://getcomposer.org/installer | \
  php -- --install-dir=/usr/bin --filename=composer

STOPSIGNAL SIGINT

EXPOSE 8080
EXPOSE 3000
EXPOSE 3001

ADD ./docker-entrypoint.sh /var/docker/docker-entrypoint.sh

RUN chmod +x /var/docker/docker-entrypoint.sh

ENTRYPOINT ["/bin/sh", "/var/docker/docker-entrypoint.sh"]
