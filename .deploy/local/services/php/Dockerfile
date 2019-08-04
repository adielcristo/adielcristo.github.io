FROM composer:latest AS composer
FROM php:fpm-alpine AS php

MAINTAINER Adiel Cristo <adielcristo@gmail.com>

# Install dependencies and tools
RUN apk add --no-cache --update --virtual .build-deps \
    autoconf \
    g++ \
    git \
    libxml2-dev \
    libzip-dev \
    make \
    openssl-dev \
    zip

# Build and install PHP extensions
RUN docker-php-ext-configure \
        opcache --enable-opcache && \
    docker-php-ext-install \
        mysqli \
        opcache \
        pdo_mysql \
        zip && \
    pecl install \
        apcu mongodb && \
    docker-php-ext-enable \
        mongodb \
        opcache

# Remove dependencies
RUN apk del --purge \
        autoconf \
        g++ \
        libxml2-dev \
        make \
        openssl-dev && \
    docker-php-source delete && \
    rm -rf /tmp/* /var/cache/apk/*

# Install Xdebug
RUN yes | pecl install xdebug && \
    docker-php-ext-enable xdebug

# Install Composer
COPY --from=composer /usr/bin/composer /usr/bin/composer
ENV COMPOSER_HOME /composer
ENV PATH $PATH:/composer/vendor/bin
ENV COMPOSER_ALLOW_SUPERUSER 0
