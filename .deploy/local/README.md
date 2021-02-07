# Development

## Requirements

1. Install [Docker][docker-install] and [Docker Compose][compose-install], and
   add the binaries to the `PATH` environment variable.

2. Then you can execute the helper scripts from the `.deploy/local/bin` folder:

    ```
    .deploy/local
    ├── bin
    │   ├── check-env.sh
    │   ├── install-env.sh
    │   └── set-aliases.sh
    ├── services
    │   ├── nginx
    │   └── php
    ├── docker-compose.yaml
    └── .env.dist
    .env
    ```

## Environment Variables

1. Access the `.deploy/local` directory, create an `.env` file from `.env.dist`,
   and set up the variables used on the containers:

    | Variable                   | Description                                            |
    | -------------------------- | ------------------------------------------------------ |
    | COMPOSE_FILE               | The project docker-compose yaml file(s).               |
    | COMPOSE_PROJECT_DIR        | The project docker-compose directory for local config. |
    | COMPOSE_PROJECT_NAME       | Project name used as prefix when creating containers.  |
    | COMPOSER_MEMORY_LIMIT      | Prevent memory limit errors as explained [here][memory-limit-errors]. |
    | DOCKER_HOST_COMPOSER_HOME  | Your local composer directory, on your host machine.   |
    | DOCKER_HOST_GID            | The group id used by php, in the format "gid".         |
    | DOCKER_HOST_UID            | The user id used by php, in the format "uid".          |
    | DOCKER_HOST_PORT_HTTP      | HTTP port on the host machine. Default: 80.            |
    | DOCKER_HOST_PORT_HTTPS     | HTTPS port used on the host machine. Default: 443.     |
    | DOCKER_HOST_YARN_CACHE_DIR | Your local yarn cache directory, on your host machine. |
    | DOCKER_HOST_YARN_DIR       | Your local yarn directory, on your host machine.       |
    | DOCKER_IMAGE_COMPOSER      | Docker image used by the base php image.               |
    | DOCKER_IMAGE_NGINX         | Docker image used by the nginx service.                |
    | DOCKER_IMAGE_NODE          | Docker base image for node services.                   |
    | DOCKER_IMAGE_NODE_BASE     | Docker image used by the base node image.              |
    | DOCKER_IMAGE_PHP           | Docker image used by the base php image.               |
    | DOCKER_IMAGE_PHP_BASE      | Docker base image for php services.                    |
    | DOCKER_IMAGE_PHP_DEV       | Docker image used by the php service.                  |
    | DOCKER_IMAGE_PHP_BASE      | Docker image used by the php service.                  |

    To get the `DOCKER_HOST_GID` and `DOCKER_HOST_UID` run the following
    commands:

    ```
    id -u <user>
    id -g <group>
    ```

## Installation

1. From the **project root folder**, run the following commands to create
   aliases for the development tools:

    ```
    COMPOSE_PROJECT_DIR=${PWD}/.deploy/local

    . .deploy/local/bin/install-env.sh
    ```

1. The following aliases will be created:

    * behat
    * composer
    * dc
    * sculpin
    * symfony
    * yarn

## Containers

1. Build the docker images:

    ```
    docker build \
        --rm \
        --build-arg DOCKER_IMAGE_COMPOSER=${DOCKER_IMAGE_COMPOSER} \
        --build-arg DOCKER_IMAGE_PHP=${DOCKER_IMAGE_PHP} \
        --cache-from ${DOCKER_IMAGE_COMPOSER} \
        --cache-from ${DOCKER_IMAGE_PHP} \
        -t ${DOCKER_IMAGE_PHP_BASE} \
        .deploy/docker/base

    dc build --parallel --force-rm
    ```

1. Run the containers:

    ```
    dc up -d
    ```

   _Note: Make sure the host ports set up to the services on the
   `docker-compose.yaml` file are free. The `ports` directive maps ports on the
   host machine to ports on the containers and follows the format
   `<host-port>:<container-port>`. More info on the [Compose file reference]
   [compose-ports]._

1. To stop the containers, run:

    ```
    dc down
    ```

## Commands

### Sculpin

1. Generate the static pages:

    ```
    sculpin generate
    ```

### Yarn

1. Install the packages:

    ```
    yarn
    ```

1. Build the assets:

    ```
    yarn encore dev --watch
    ```

[compose-install]: https://docs.docker.com/compose/install/
[compose-ports]: https://docs.docker.com/compose/compose-file/#ports
[docker-install]: https://docs.docker.com/install/
[memory-limit-errors]: https://getcomposer.org/doc/articles/troubleshooting.md#memory-limit-errors
