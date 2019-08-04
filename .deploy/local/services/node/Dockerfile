FROM node:alpine AS node

MAINTAINER Adiel Cristo <adielcristo@gmail.com>

# Install dependencies and tools
RUN apk add --no-cache --update --virtual .build-deps \
    g++ \
    make \
    python
