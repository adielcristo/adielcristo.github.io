ARG DOCKER_IMAGE_COMPOSER
ARG DOCKER_IMAGE_PHP

FROM ${DOCKER_IMAGE_COMPOSER} AS composer
FROM ${DOCKER_IMAGE_PHP} AS php

LABEL maintainer="Adiel Cristo <adiel@adielcristo.com>"

ARG PACKAGE_AUTOCONF="autoconf=2.69-r3"
ARG PACKAGE_GPP="g++=10.2.1_pre1-r3"
ARG PACKAGE_MAKE="make=4.3-r0"

ARG PACKAGE_GETTEXT_DEV="gettext-dev=0.20.2-r2"
ARG PACKAGE_GIT="git=2.30.0-r0"
ARG PACKAGE_ICU_DEV="icu-dev=67.1-r2"
ARG PACKAGE_LIBXML2_DEV="libxml2-dev=2.9.10-r6"
ARG PACKAGE_LIBZIP_DEV="libzip-dev=1.7.3-r2"
ARG PACKAGE_OPENSSH="openssh=8.4_p1-r2"
ARG PACKAGE_OPENSSL_DEV="openssl-dev=1.1.1i-r0"

ARG PACKAGE_APCU="apcu-5.1.19"

# Install PHP extensions and tools
RUN apk update && \
    apk add --no-cache --virtual .build-deps \
        ${PACKAGE_AUTOCONF} \
        ${PACKAGE_GPP} \
        ${PACKAGE_MAKE} && \
    apk add --no-cache --virtual .tool-deps \
        ${PACKAGE_GETTEXT_DEV} \
        ${PACKAGE_GIT} \
        ${PACKAGE_ICU_DEV} \
        ${PACKAGE_LIBXML2_DEV} \
        ${PACKAGE_LIBZIP_DEV} \
        ${PACKAGE_OPENSSH} \
        ${PACKAGE_OPENSSL_DEV} && \
    docker-php-ext-install -j "$(nproc)" \
        gettext \
        intl \
        mysqli \
        opcache \
        pdo_mysql \
        zip && \
    pecl install \
        ${PACKAGE_APCU} && \
    docker-php-ext-enable \
        apcu && \
    apk del --purge .build-deps && \
    docker-php-source delete

# Install Composer
COPY --from=composer /usr/bin/composer /usr/bin/composer
ENV COMPOSER_HOME /composer
ENV PATH ${PATH}:/composer/vendor/bin
ENV COMPOSER_ALLOW_SUPERUSER 0
