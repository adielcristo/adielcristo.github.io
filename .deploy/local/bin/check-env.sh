#!/usr/bin/env bash

# Check .env file

if [[ -f "${COMPOSE_PROJECT_DIR}/.env" ]]; then
    . "${COMPOSE_PROJECT_DIR}/.env"
else
    echo ".env file not found on docker folder."
    echo "Errors were found. Aborting..."
    exit 1
fi

if [[ -f "${COMPOSE_PROJECT_DIR}/../../.env.local" ]]; then
    . "${COMPOSE_PROJECT_DIR}/../../.env.local"
else
    echo ".env.local file not found on project folder."
    echo "Errors were found. Aborting..."
    exit 1
fi

# Check env vars

declare -a env_vars=(
    # docker
    "COMPOSE_FILE"
    "COMPOSE_PROJECT_DIR"
    "COMPOSE_PROJECT_NAME"
    "DOCKER_HOST_COMPOSER_HOME"
    "DOCKER_HOST_YARN_CACHE_DIR"
    "DOCKER_HOST_YARN_DIR"
    "DOCKER_HOST_GID"
    "DOCKER_HOST_UID"
    "DOCKER_HOST_PORT_HTTP"
    "DOCKER_HOST_PORT_HTTPS"
    "DOCKER_IMAGE_COMPOSER"
    "DOCKER_IMAGE_NGINX"
    "DOCKER_IMAGE_NODE"
    "DOCKER_IMAGE_NODE_BASE"
    "DOCKER_IMAGE_PHP"
    "DOCKER_IMAGE_PHP_BASE"
    "DOCKER_IMAGE_PHP_DEV"

    # composer
    "COMPOSER_MEMORY_LIMIT"

    # application
    "APP_BASE_URL"
)

env_checks=true

for i in "${env_vars[@]}"; do
    if [[ -z ${!i} ]]; then
        echo "Variable ${i} unset."
        env_checks=false
    fi
done

if [[ "$env_checks" = false ]]; then
    echo "Errors were found. Aborting..."
    exit 1
fi
