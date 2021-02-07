ARG DOCKER_IMAGE_PHP_BASE

FROM ${DOCKER_IMAGE_PHP_BASE} AS base

LABEL maintainer="Adiel Cristo <adiel@adielcristo.com>"

ARG PACKAGE_AUTOCONF="autoconf=2.69-r3"
ARG PACKAGE_GPP="g++=10.2.1_pre1-r3"
ARG PACKAGE_MAKE="make=4.3-r0"

ARG PACKAGE_BASH="bash=5.1.0-r0"
ARG PACKAGE_WGET="wget=1.21.1-r1"

ARG PACKAGE_XDEBUG="xdebug-3.0.2"

# Install Xdebug and Symfony CLI
RUN apk update && \
    apk add --no-cache --virtual .xdebug-deps \
        ${PACKAGE_AUTOCONF} \
        ${PACKAGE_GPP} \
        ${PACKAGE_MAKE} && \
    yes | pecl install \
        ${PACKAGE_XDEBUG} && \
    docker-php-ext-enable \
        xdebug && \
    apk add --no-cache --virtual .symfony-deps \
        ${PACKAGE_BASH} \
        ${PACKAGE_WGET} && \
    wget https://get.symfony.com/cli/installer -O - | bash && \
    mv /root/.symfony/bin/symfony /usr/local/bin/symfony && \
    apk del --purge \
        .symfony-deps \
        .xdebug-deps
