# Docker

## Requirements

- Docker 19.03

## Installation

1. Install [Docker][docker-install] and add the binaries to the `PATH`
   environment variable.

1. Build the base image:

    ```
    docker build -t ${DEV_DOCKER_IMAGE_PHP}:base .deploy/docker/base
    ```

[docker-install]: https://docs.docker.com/install/
