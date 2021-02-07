ARG DOCKER_IMAGE_NODE

FROM ${DOCKER_IMAGE_NODE} AS node

LABEL maintainer="Adiel Cristo <adiel@adielcristo.com>"

ARG PACKAGE_GPP="g++=9.3.0-r2"
ARG PACKAGE_MAKE="make=4.3-r0"
ARG PACKAGE_PYTHON="python2=2.7.18-r0"

# Install dependencies and tools
RUN apk add --no-cache --update --virtual .build-deps \
    ${PACKAGE_GPP} \
    ${PACKAGE_MAKE} \
    ${PACKAGE_PYTHON}
